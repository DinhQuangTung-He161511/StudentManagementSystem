using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
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
            ViewData["ClassId"] = new SelectList(_context.Classes, "ClassId", "ClassClassName");
            ViewData["MajorId"] = new SelectList(_context.Majors, "MajorId", "MajorName");
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Students.Add(Student);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}