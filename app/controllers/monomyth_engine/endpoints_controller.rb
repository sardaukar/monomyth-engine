module MonomythEngine
  class EndpointsController < ApplicationController

    def serve
      if config = get_config(params)

        format = config.delete('format') || :json

        actions = get_actions_from_config(config)

        outputs = {}
        actions.each_pair do |k,v|
          outputs[k] = JSON.parse(v[:cont].action(v[:action]).call(fake_env(format)).last.body)
        end

        render json: outputs

      else
        render json: {message: "endpoint unknown"}, status: 400
      end
    end

    private

    def get_config params
      MonomythEngine.facades['facades'][params['path']]
    end

    def get_actions_from_config config
      {}.tap do |h|
        config.each_pair do |k,v|
          cont, action = v.split('#')
          h[k.to_sym] = {cont: "#{cont.capitalize}Controller".constantize, action: action}
        end
      end
    end

  end
end
