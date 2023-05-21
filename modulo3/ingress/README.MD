
# Solución y resolución de issues encontrados en el ejercicio 2 Ingress todo-front.

Siguiendo los pasos del ejercicio Ingress, he desglosado el mismo en tres pasos:

## 1) Crear todo-front:

   * Un deployment cuya imagen Docker fue generada y cargada a Docker Hub
   * Un Servicio
   * Ejecutar `k apply -f . `

- **Evidencia 1** - ![Figura 1](../Assets/Ingress_todo-front-dplymnt.jpg)

   Una vez aplicados los manifiestos el ` k apply -f . ` procedo a generar la base de datos con:

## 2) Crear todo-api:

   Siguiendo los pasos

   * Un deployment
   * Un servicio
   * Un configMap
   * Ejecutar `k apply -f . `

   - **Evidencia 2** - ![Figura 2](../Assets/Ingress_todo-api-dplymnt.jpg)

## 2) Crear el servicio ingress con Nginx para Minikube

Configurando el NGINX Ingress Controller

`minikube addons enable ingress`

- **Evidencia 3** - ![Figura 3](../Assets/Ingress_install-addons.jpg)

verificar que el ingress está habilitado

`k get pods -n ingress-nginx`

- **Evidencia 4** - ![Figura 4](../Assets/Ingress_todo-ingress-service.jpg)

## Issues encontrados:

   Al ejecutar la ip en el navegador no aparece, es como que el servicio está siendo refused en algún momento.

- **Evidencia 4** - ![Figura 5](../Assets/Ingress_host-error-browser.jpg)

### Intentos de resolución:

   - * Reinstalar un nuevo Cluster de Minikube `minikube delete` y `minikube start --driver=docker`
   - * Verificar logs de los pods
   - * Verificando reglas firewall, tampoco es el problema.

- **Evidencia 5** - ![Figura 6](../Assets/Ingress-logs-front.jpg)
- **Evidencia 6** - ![Figura 7](../Assets/Ingress-logs-api.jpg)