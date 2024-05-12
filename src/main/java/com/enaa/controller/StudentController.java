package com.enaa.controller;

import com.enaa.dao.StudentDAOImpl;
import com.enaa.model.Student;
import com.enaa.dao.StudentDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    private final StudentDAO studentDAO = new StudentDAOImpl();

    @GetMapping("/list")
    public String listStudents(Model model) {
        List<Student> students = studentDAO.getAllStudents();
        model.addAttribute("students", students);
        model.addAttribute("student", new Student());
        return "student-list";
    }

    @PostMapping("/save")
    public String saveOrUpdateStudent(@ModelAttribute("student") Student student) {
        if (student.getId() == 0) {
            studentDAO.createStudent(student);
        } else {
            studentDAO.updateStudent(student);
        }
        return "redirect:/students/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") int id) {
        studentDAO.deleteStudent(id);
        return "redirect:/students/list";
    }
}