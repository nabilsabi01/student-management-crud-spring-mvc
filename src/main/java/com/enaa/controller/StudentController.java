package com.enaa.controller;

import com.enaa.model.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {
    private final List<Student> students = new ArrayList<>();
    private int nextId = 1;

    @PostConstruct
    public void init() {
        students.add(new Student(nextId++, "John", "Doe"));
        students.add(new Student(nextId++, "Jane", "Smith"));
        students.add(new Student(nextId++, "Alice", "Johnson"));
    }
    @GetMapping("/list")
    public String listStudents(Model model) {
        model.addAttribute("students", students);
        return "student-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        return "add-student";
    }

    @PostMapping("/add")
    public String addStudent(@ModelAttribute("student") Student student) {
        student.setId(nextId++);
        students.add(student);
        return "redirect:/students/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Student student = getStudentById(id);
        if (student == null) {
            return "redirect:/students/list";
        }
        model.addAttribute("student", student);
        return "edit-student";
    }

    @PostMapping("/edit/{id}")
    public String updateStudent(@PathVariable("id") int id, @ModelAttribute("student") Student updatedStudent) {
        Student student = getStudentById(id);
        if (student != null) {
            student.setFirstName(updatedStudent.getFirstName());
            student.setLastName(updatedStudent.getLastName());
        }
        return "redirect:/students/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") int id) {
        students.removeIf(student -> student.getId() == id);
        return "redirect:/students/list";
    }

    private Student getStudentById(int id) {
        for (Student student : students) {
            if (student.getId() == id) {
                return student;
            }
        }
        return null;
    }
}
