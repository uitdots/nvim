---@module 'mason'
---@type RegistryPackageSpec
return {
  name = "junit",
  schema = "registry+v1",
  description = [[Module "junit-platform-console-standalone" of JUnit]],
  homepage = "https://mvnrepository.com/artifact/org.junit.platform/junit-platform-console-standalone",
  licenses = {
    "EPL-2.0",
  },
  languages = {
    "Java",
  },
  categories = {
    "Runtime",
    "Testing",
  },
  source = {
    id = "pkg:generic/org.junit.platform/junit-platform-console-standalone@6.0.1",
    download = {
      files = {
        ["junit-platform-console-standalone.jar"] = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/{{version}}/junit-platform-console-standalone-{{version}}.jar",
      },
    },
  },
  share = {
    ["junit/junit-platform-console-standalone.jar"] = "junit-platform-console-standalone.jar",
  },
}
