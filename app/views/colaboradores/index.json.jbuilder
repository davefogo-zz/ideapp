json.array!(@colaboradores) do |colaboradore|
  json.extract! colaboradore, :id, :nombre, :cédula, :dirección, :teléfono_personal, :teléfono_empresa, :cargo, :departamento, :jefe_inmediato
  json.url colaboradore_url(colaboradore, format: :json)
end
