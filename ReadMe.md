#Read Me
# DockerFoolAzureAdventure

I was working through the book
"Containerize your Apps with Docker and Kubernetes" by Gabriel N. Schenker (Packt 2018)
(version Distributed free by Microsoft)
when, reaching chapter 3, I came across an example that did not work.  No fault of the author; he had relied on a random quote server that had been taken off line.

Still, I wanted to work through the example.  "Hey," I thought, "I can serve my own quotes using another docker container."

And, this turned out to be true.

One shell script, `refresh.sh`, refreshes and starts the server in question

The other shell script, `client.sh`, asks it for a random quote.

This works on Docker Desktop for the MacOS YMMV

The "quotes" are statistics glossary terms extracted from the book Think Stats 2, Second Edition by Allen B Downey, which you can download, read, and even purchase

https://greenteapress.com/wp/think-stats-2e/

This book is under the Creative Commons Attribution-NonCommercial 3.0 Unported License, which means that you are free to copy, distribute, and modify it, as long as you attribute the work and don’t use it for commercial purposes.  https://creativecommons.org/licenses/by-nc/3.0/

Thank you, Allen!
