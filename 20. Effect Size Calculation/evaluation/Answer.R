context({
  testcase(
    " ",
    {
      testEqual(
        "",
        function(env) as.numeric(env$evaluationResult),
        0.64,  # the correct Cohen's d
        comparator = function(generated, expected, ...) {
          # Get the exact student answer for feedback
          student_answer <- tryCatch({
            as.numeric(generated)
          }, error = function(e) {
            return(NA)
          })
          
          # Data from the problem
          mean1 <- 45    # Before intervention
          mean2 <- 38    # After intervention
          sd1 <- 12      # SD before
          sd2 <- 10      # SD after  
          n1 <- 25       # Sample size before
          n2 <- 25       # Sample size after
          
          # Calculations
          # Pooled standard deviation
          pooled_var <- ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1 + n2 - 2)
          pooled_sd <- sqrt(pooled_var)  # 11.05
          
          # Cohen's d
          cohens_d <- (mean1 - mean2) / pooled_sd  # 0.634
          cohens_d_rounded <- round(cohens_d, 2)   # 0.63
          
          # Determine if answer is correct (allowing small rounding differences)
          is_correct <- !is.na(student_answer) && abs(student_answer - cohens_d_rounded) < 0.02
          
          if (is_correct) {
            # Determine effect size interpretation
            effect_interpretation <- if(cohens_d_rounded < 0.2) {
              "klein effect"
            } else if(cohens_d_rounded < 0.5) {
              "klein tot gemiddeld effect"
            } else if(cohens_d_rounded < 0.8) {
              "gemiddeld effect"
            } else {
              "groot effect"
            }
            
            # Detailed feedback for correct answer
            get_reporter()$add_message(
              paste0("✅ Juist! Cohen's d is inderdaad ", cohens_d_rounded, ".\n\n",
                    "**Stapsgewijze berekening:**\n\n",
                    "**Stap 1: Gepoolde standaarddeviatie**\n",
                    "s²pooled = [(n₁-1)s₁² + (n₂-1)s₂²] / (n₁+n₂-2)\n",
                    "s²pooled = [(", n1, "-1)×", sd1, "² + (", n2, "-1)×", sd2, "²] / (", n1, "+", n2, "-2)\n",
                    "s²pooled = [", n1-1, "×", sd1^2, " + ", n2-1, "×", sd2^2, "] / ", n1+n2-2, "\n",
                    "s²pooled = [", (n1-1)*sd1^2, " + ", (n2-1)*sd2^2, "] / ", n1+n2-2, " = ", round(pooled_var, 2), "\n",
                    "spooled = √", round(pooled_var, 2), " = ", round(pooled_sd, 2), "\n\n",
                    "**Stap 2: Cohen's d berekenen**\n",
                    "d = (x̄₁ - x̄₂) / spooled\n",
                    "d = (", mean1, " - ", mean2, ") / ", round(pooled_sd, 2), "\n",
                    "d = ", mean1-mean2, " / ", round(pooled_sd, 2), " = ", cohens_d_rounded, "\n\n",
                    "**Stap 3: Interpretatie**\n",
                    "Met d = ", cohens_d_rounded, " hebben we een **", effect_interpretation, "** volgens Cohen's benchmarks.\n\n",
                    "**Praktische betekenis:**\n",
                    "- Statistisch significant (p = 0.02) ✓\n",
                    "- Praktisch betekenisvol (d = ", cohens_d_rounded, " > 0.5) ✓\n",
                    "- De interventie lijkt zowel statistisch als praktisch effectief te zijn!\n\n",
                    "**Beleidsadvies:** Dit resultaat rechtvaardigt voortzetting en mogelijk uitbreiding van de interventie."), 
              type = "markdown"
            )
          } else {
            # Feedback for incorrect answers
            if (is.na(student_answer)) {
              get_reporter()$add_message(
                "❌ Fout. Je hebt geen geldige numerieke waarde ingevoerd. Voer Cohen's d in als een getal, bijvoorbeeld: 0.64", 
                type = "markdown")
            } else if (abs(student_answer - (mean1 - mean2)) < 0.5) {
              get_reporter()$add_message(
                paste0("❌ Fout. Je hebt ", student_answer, " geantwoord, maar dit is alleen het **verschil tussen de gemiddelden**, niet Cohen's d.\n\n",
                       "Je moet het verschil delen door de gepoolde standaarddeviatie:\n",
                       "d = (x̄₁ - x̄₂) / spooled = ", mean1-mean2, " / ", round(pooled_sd, 2), " = ", cohens_d_rounded), 
                type = "markdown")
            } else if (abs(student_answer - round(pooled_sd, 2)) < 0.1) {
              get_reporter()$add_message(
                paste0("❌ Fout. Je hebt ", student_answer, " geantwoord, maar dit lijkt de **gepoolde standaarddeviatie** te zijn, niet Cohen's d.\n\n",
                       "Cohen's d is: d = (x̄₁ - x̄₂) / spooled = ", cohens_d_rounded), 
                type = "markdown")
            } else if (student_answer < 0 && cohens_d_rounded > 0) {
              get_reporter()$add_message(
                paste0("❌ Fout. Je antwoord ", student_answer, " is negatief, maar Cohen's d moet **positief** zijn in dit geval.\n\n",
                       "Voor interventie: ", mean1, " > Na interventie: ", mean2, " = reductie in misdrijven\n\n",
                       "Dit is een **positief effect**, dus d = (", mean1, " - ", mean2, ") / spooled = positief\n\n",
                       "Het juiste antwoord is ", cohens_d_rounded), 
                type = "markdown")
            } else if (abs(student_answer - round((mean1-mean2)/sd1, 2)) < 0.05 || abs(student_answer - round((mean1-mean2)/sd2, 2)) < 0.05) {
              get_reporter()$add_message(
                paste0("❌ Bijna goed! Je hebt waarschijnlijk één van de individuele standaarddeviaties gebruikt in plaats van de **gepoolde** standaarddeviatie.\n\n",
                       "Voor Cohen's d gebruik je spooled = ", round(pooled_sd, 2), ", niet s₁ of s₂ apart.\n\n",
                       "Het juiste antwoord is ", cohens_d_rounded), 
                type = "markdown")
            } else {
              get_reporter()$add_message(
                paste0("❌ Fout. Je antwoord ", student_answer, " is niet correct. Cohen's d is ", cohens_d_rounded, ".\n\n",
                       "**Controleer je berekening:**\n\n",
                       "1. Gepoolde variantie: s²pooled = ", round(pooled_var, 2), "\n",
                       "2. Gepoolde SD: spooled = ", round(pooled_sd, 2), "\n",
                       "3. Verschil gemiddelden: ", mean1, " - ", mean2, " = ", mean1-mean2, "\n",
                       "4. Cohen's d: ", mean1-mean2, " / ", round(pooled_sd, 2), " = ", cohens_d_rounded, "\n\n",
                       "**Tip:** Gebruik de gepoolde standaarddeviatie, niet de individuele standaarddeviaties."), 
                type = "markdown")
            }
          }
          
          return(is_correct)
        }
      )
    }
  )
})
