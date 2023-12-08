package team.dave

import future.keywords.if

default allowed := false

allowed if {
  input.name == "dave"
}

foo := "baz"
