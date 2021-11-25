package main

import (
	"echo_sql_rest/db"
	"echo_sql_rest/routes"
)

func main() {
	db.Init()

	e := routes.Init()

	e.Logger.Fatal(e.Start(":80"))
}
