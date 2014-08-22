module MonomythEngine
  class EndpointsController < ApplicationController

    def serve
      if config = get_config(params)

        format = config.delete('format') || :json

        actions = get_actions_from_config(config)

        outputs = {}
        actions.each_pair do |k,v|
          outputs[k] = JSON.parse(v[:cont].action(v[:action]).call(fake_env(format)).last.body)

          outputs[k] = apply_transform(v[:transform], outputs[k])
        end

        render json: outputs

      else
        render json: {message: "endpoint unknown"}, status: 400
      end
    end

    private

    def apply_transform transform_hash, json
      return json unless transform_hash

      dir, value = transform_hash.assoc('top') || transform_hash.assoc('bottom')

      case dir
      when 'top'
        json.first(value)
      when 'bottom'
        json.last(value)
      end
    end

    def get_config params
      MonomythEngine.facades['facades'][params['path']]
    end

    def get_actions_from_config config
      {}.tap do |h|
        config.each_pair do |k,v|
          h[k.to_sym] = {}

          cont, action = if v.is_a?(Hash)
            h[k.to_sym][:transform] = v.reject {|k,v| k == 'route' }
            v['route'].split('#')
          else
            v.split('#')
          end

          h[k.to_sym][:cont] = "#{cont.capitalize}Controller".constantize
          h[k.to_sym][:action] = action
        end
      end
    end

  end
end
