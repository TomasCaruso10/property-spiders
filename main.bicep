param projectName string
param jobs array = []
@secure()
param logfireToken string
@secure()
param twoCaptchaApiKey string
@secure()
param registryPassword string
param registryUsername string
param registryServer string = 'docker.io'
param serviceBusSku string = 'Basic'
param serviceBusNamespaceName string = '${projectName}-sb'
param containerAppEnvironmentName string = '${projectName}-aca-env'
param logAnalyticsWorkspaceName string = '${projectName}-law'
@secure()
param dataverseConfig object


/* ------------------------------ */
/*  Módulo: Scrapper */
/* ------------------------------ */
module Spiders '.azure/apps/scrapper/main.bicep' = {
  name: 'spiders-app'
  params: {
    projectName: projectName
    jobs: jobs
    logfireToken: logfireToken
    twoCaptchaApiKey: twoCaptchaApiKey
    registryPassword: registryPassword
    registryUsername: registryUsername
    registryServer: registryServer
    dataverseConfig: dataverseConfig
    serviceBusSku: serviceBusSku
    serviceBusNamespaceName: serviceBusNamespaceName
    containerAppEnvironmentName: containerAppEnvironmentName
    logAnalyticsWorkspaceName: logAnalyticsWorkspaceName
  }
}

// param projectName string
// param jobs array = []

// @secure()
// param logfireToken string

// @secure()
// param twoCaptchaApiKey string

// @secure()
// param registryPassword string
// param registryUsername string
// param registryServer string = 'docker.io'

// param serviceBusSku string = 'Basic'
// param serviceBusNamespaceName string = '${projectName}-sb'

// param containerAppEnvironmentName string = '${projectName}-aca-env'
// param logAnalyticsWorkspaceName string = '${projectName}-law'

// @secure()
// param dataverseConfig object

// /* ------------------------------ */
// /*  Módulo: ACA Environment + LAW */
// /* ------------------------------ */
// // ... (params iguales a los tuyos)

// module Enviroment 'infra/containerEnv.bicep' = {
//   name: 'aca-environment'
//   params: {
//     containerAppEnvironmentName: containerAppEnvironmentName
//     logAnalyticsWorkspaceName:   logAnalyticsWorkspaceName
//   }
// }

// /* ------------------------------ */
// /*  Service Bus Namespace (módulo)*/
// /* ------------------------------ */
// module ServiceBus 'infra/sb.bicep' = {
//   name: 'servicebus-namespace'
//   params: {
//     serviceBusNamespaceName: serviceBusNamespaceName
//     Sku: serviceBusSku
//     queueNames: [for job in jobs: job.queueName]   // ← PASO LAS COLAS ACÁ
//   }
// }

// // (ELIMINADO) módulo SBQueues: ya no hace falta

// /* ----------------------------------------- */
// /*  Desplegar los Container App Jobs         */
// /* ----------------------------------------- */
// module containers 'infra/containerjob.bicep' = [for (job,i) in jobs: {
//   name: '${job.jobName}-job'
//   params: {
//     jobName:                    job.jobName
//     containerAppEnviromentId:    Enviroment.outputs.environmentId

//     image:                       job.image
//     registryServer:              registryServer
//     registryUsername:            registryUsername
//     registryPassword:            registryPassword

//     logfireToken:                logfireToken
//     twoCaptchaApiKey:            twoCaptchaApiKey

//     // Service Bus (nombre + conn string segura)
//     serviceBusNamespace:         ServiceBus.outputs.namespaceName
//     serviceBusConnectionString:  ServiceBus.outputs.connectionString

//     // Usás el nombre de la queue del job
//     queueName:                   job.queueName

//     envVars:                     job.envVars
//     dataverseConfig:             dataverseConfig
//   }
// }]


// // // Crear las colas necesarias para los jobs
// // module SBQueues 'infra/sb-queue.bicep' = [for job in jobs: {
// //   name: '${job.queueName}'
// //   params: {
// //     serviceBusNamespaceName: ServiceBus.name
// //     queueName: job.queueName
// //   }
// // }]

// // /* ----------------------------------------- */
// // /*  Desplegar los Container App Jobs         */
// // /* ----------------------------------------- */
// // module containers 'infra/containerjob.bicep' = [for job in jobs: {
// //   name: '${job.jobName}-job'
// //   params: {
// //     job_name:                   job.jobName
// //     containerAppEnviromentId: Enviroment.outputs.environmentId

// //     image:                      job.image
// //     registryServer:             registryServer
// //     registryUsername:           registryUsername
// //     registryPassword:           registryPassword

// //     logfireToken:              logfireToken
// //     twoCaptchaApiKey:          twoCaptchaApiKey
// //     dataverseConfig:           dataverseConfig

// //     serviceBusNamespace:        ServiceBus.name
// //     serviceBusConnectionString: ServiceBus.outputs.connectionString
// //     queueName:                  job.queueName

// //     messageCount:               string(job.messageCount)
// //     timeout:                    int(job.timeout)
// //     retryLimit:                 int(job.retryLimit)
// //     parallelism:                int(job.parallelism)
// //     maxExecutions:              int(job.maxExecutions)
// //     minExecutions:              int(job.minExecutions)
// //     pollingInterval:            int(job.pollingInterval)
// //     replicaCompletionCount:     int(job.replicaCompletionCount)

// //     cpu:                        job.cpu
// //     memory:                     job.memory
// //     envVars:                    job.envVars
// //   }
// // }]

// // output jobIds array = [for (job, i) in jobs: containers[i].outputs.jobResourceId]
