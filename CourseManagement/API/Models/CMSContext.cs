using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace API.Models
{
    public partial class CMSContext : DbContext
    {
        public CMSContext()
        {
        }

        public CMSContext(DbContextOptions<CMSContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Assignment> Assignments { get; set; } = null!;
        public virtual DbSet<Course> Courses { get; set; } = null!;
        public virtual DbSet<CourseEnrollment> CourseEnrollments { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<Quiz> Quizzes { get; set; } = null!;
        public virtual DbSet<QuizAttendance> QuizAttendances { get; set; } = null!;
        public virtual DbSet<StudentAssignment> StudentAssignments { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=LAPTOP-9LBBS3VQ;Database=CMS;user=sa;password=1234;TrustServerCertificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Assignment>(entity =>
            {
                entity.ToTable("Assignment");

                entity.Property(e => e.Deadline).HasColumnType("datetime");

                entity.Property(e => e.File).HasMaxLength(255);

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Assignments)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Assignmen__Cours__37A5467C");
            });

            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("Course");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.Lecturer)
                    .WithMany(p => p.Courses)
                    .HasForeignKey(d => d.LecturerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Course__Lecturer__267ABA7A");
            });

            modelBuilder.Entity<CourseEnrollment>(entity =>
            {
                entity.HasKey(e => e.EnrollmentId)
                    .HasName("PK__CourseEn__7F68771BB15FB21B");

                entity.ToTable("CourseEnrollment");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseEnrollments)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CourseEnr__Cours__29572725");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.CourseEnrollments)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CourseEnr__Stude__2A4B4B5E");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.ToTable("Question");

                entity.Property(e => e.CorrectOption).HasMaxLength(1);

                entity.Property(e => e.Question1).HasColumnName("Question");

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Question__QuizId__300424B4");
            });

            modelBuilder.Entity<Quiz>(entity =>
            {
                entity.ToTable("Quiz");

                entity.Property(e => e.Title).HasMaxLength(255);

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Quizzes)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Quiz__CourseId__2D27B809");
            });

            modelBuilder.Entity<QuizAttendance>(entity =>
            {
                entity.HasKey(e => e.AttendanceId)
                    .HasName("PK__QuizAtte__8B69261CC1EA8763");

                entity.ToTable("QuizAttendance");

                entity.HasIndex(e => new { e.QuizId, e.StudentId }, "UC_QuizAttendance")
                    .IsUnique();

                entity.HasOne(d => d.Quiz)
                    .WithMany(p => p.QuizAttendances)
                    .HasForeignKey(d => d.QuizId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__QuizAtten__QuizI__33D4B598");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.QuizAttendances)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__QuizAtten__Stude__34C8D9D1");
            });

            modelBuilder.Entity<StudentAssignment>(entity =>
            {
                entity.HasKey(e => e.SubmissionId)
                    .HasName("PK__StudentA__449EE1257085891F");

                entity.ToTable("StudentAssignment");

                entity.HasIndex(e => new { e.AssignmentId, e.StudentId }, "UC_StudentAssignment")
                    .IsUnique();

                entity.Property(e => e.File).HasMaxLength(255);

                entity.Property(e => e.SubmissionDate).HasColumnType("datetime");

                entity.HasOne(d => d.Assignment)
                    .WithMany(p => p.StudentAssignments)
                    .HasForeignKey(d => d.AssignmentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StudentAs__Assig__3B75D760");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.StudentAssignments)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__StudentAs__Stude__3C69FB99");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.Email).HasMaxLength(255);

                entity.Property(e => e.Password).HasMaxLength(100);

                entity.Property(e => e.Role).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.Username).HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
