package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func v1GetPath1(c *gin.Context) {
	str := c.Param("id")
	c.String(http.StatusOK, "Hi, Septem "+str)
}

func main() {
	router := gin.Default()

	v1 := router.Group("/v1")
	{
		v1.GET("/path/:id", v1GetPath1)
	}

	if err := http.ListenAndServe(":8080", router); err != nil {
		return
	}
}
