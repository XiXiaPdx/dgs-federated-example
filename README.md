All credit to NetFlix, should have just forked the original repo. This repository is a GraphQL demo of using the DGS framework together with Apollo Federation Server.

This is "ready" to be instrumented by the New Relic Apollo plugin and the New Relic Java agent. 

Apollo-gateway 

1. The apollo-gateway is setup to be instrumented by the New Relic Apollo plugin (which includes the Node agent). 
2. Run `npm install` in the `apollo-gateway` project
3. Set the following _required_ environment variables:
   


`NR_LICENSE` - this should be your license key. This will be used in `newrelic.js` in the Apollo-gateway directory.

`APOLLO_NAME` - app name reported to New Relic for the apollo-gateway.

4. Set the following _optional_ environment variables:
   
`REVIEWS_AGENT_PATH` - the path to the New Relic Java agent that will instrument reviews-dgs. 


`SHOWS_AGENT_PATH` - the path to the New Relic Java agent that will instrument shows-dgs.

5. Run `runit.sh` script to start all three services. When you are done, `crtl+c` will terminate all three services.

***

Documentation for the DGS framework can be found [here](https://netflix.github.io/dgs).

The repository contains three separate projects:

1. `shows-dgs`: A Kotlin GraphQL service providing the federated `Show` type
2. `reviews-dgs`: A Java GraphQL service that extends the `Show` type with `reviews`
3. `apollo-gateway`: An instance of Apollo Server acting as the Federated Gateway

The `shows-dgs` and `reviews-dgs` projects are Gradle projects.
The `apollo-gateway` is a Node project.
We recommend to import the three individual projects in Intellij.

Running the demo
----

1. Start `show-dgs` by running the Spring Boot app from the IDE or `./gradlew bootRun`
2. Start `reviews-dgs` by running the Spring Boot app from the IDE or `./gradlew bootRun`
3. Run `npm install` in the `apollo-gateway` project
4. Run `node index.js` in the `apollo-gateway` project
5. Open http://localhost:4000 for the query editor

The following is a federated query that should work.

```graphql
{
  shows {
    title
    reviews {
      starRating
    }
  }
}
```

Other DGS framework examples
----

* Standalone DGS in [Java](https://github.com/Netflix/dgs-examples-java)
* Standalone DGS in [Kotlin](https://github.com/Netflix/dgs-examples-kotlin)
