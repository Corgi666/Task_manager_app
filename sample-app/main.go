package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetial string `json:"task_detial"`
	Date       string `json:"date"`
}

var tasks []Tasks

func allTasks() {
	task := Tasks{
		ID: "1", TaskName: "New Project",
		TaskDetial: "Detial",
		Date:       "05/05/2023",
	}
	tasks = append(tasks, task)

	task1 := Tasks{
		ID: "2", TaskName: "Task2",
		TaskDetial: "More Detial",
		Date:       "06/05/2023",
	}
	tasks = append(tasks, task1)
	fmt.Println("your task are", tasks)
}
func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("i am homepage")
}
func getTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	taskID := mux.Vars(r)["id"]
	for _, task := range tasks {
		if task.ID == taskID {
			json.NewEncoder(w).Encode(task)
			return
		}
	}
	json.NewEncoder(w).Encode(map[string]string{"error": "Task not found"})
}
func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-type", "application/")
	json.NewEncoder(w).Encode(tasks)
}
func createTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("i am homepage")
}
func deleteTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("i am homepage")
}
func updateTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("i am homepage")
}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8082", router))
}

func main() {

	allTasks()
	fmt.Println("BBQ PORK IS HALAL")
	handleRoutes()
}
