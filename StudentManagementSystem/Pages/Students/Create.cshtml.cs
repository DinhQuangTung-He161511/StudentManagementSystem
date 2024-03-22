using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StudentManagementSystem.Models;

namespace StudentManagementSystem.Pages.Students
{
    public class CreateModel : PageModel
    {
        private readonly PRN221_StudentManagementSystemContext _context;

        public CreateModel(PRN221_StudentManagementSystemContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
            ViewData["ClassId"] = new SelectList(_context.Classes, "ClassId", "ClassClassName");
            ViewData["MajorId"] = new SelectList(_context.Majors, "MajorId", "MajorName");
            return Page();
        }

        [BindProperty]
        public Student Student { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            ViewData["MajorId"] = new SelectList(_context.Majors, "MajorId", "MajorName");
            ViewData["ClassId"] = new SelectList(_context.Classes, "ClassId", "ClassClassName");

            if (!ModelState.IsValid)
            {
                return Page();
            }

            try
            {
                // Check if a student with the same ID already exists
                if (await IsDuplicateStudentId(Student.StudentId))
                {
                    ModelState.AddModelError(string.Empty, "A student with the same ID already exists.");
                    return Page();
                }

                // Check if a student with the same email already exists
                if (await IsDuplicateEmail(Student.StudentEmail))
                {
                    ModelState.AddModelError(string.Empty, "A student with the same email already exists.");
                    return Page();
                }

                // If no duplicate student ID or email, proceed with insertion
                _context.Students.Add(Student);
                await _context.SaveChangesAsync();

                return RedirectToPage("./Index");
            }
            catch (DbUpdateException ex)
            {
                // Handle the exception appropriately (e.g., log the error)
                ModelState.AddModelError(string.Empty, "An error occurred while saving the student data.");
                return Page();
            }
        }

        private async Task<bool> IsDuplicateStudentId(string studentId)
        {
            return await _context.Students.AnyAsync(s => s.StudentId == studentId);
        }

        private async Task<bool> IsDuplicateEmail(string email)
        {
            return await _context.Students.AnyAsync(s => s.StudentEmail == email);
        }
    }
}