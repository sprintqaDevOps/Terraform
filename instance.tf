resource "aws_instance" "web" {
  ami                    = "ami-038f1ca1bd58a5790"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg_1.id]
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = "my_macbook_key"

  tags = {
    Name = "My_ec2"
  }
}

-----BEGIN PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEArFbgosSYOzgCUrNENqa9PxqzBoPLxD2B+2qMytV8tTM88Vt7GIzZ
aJWNurbbvuEODh4dJNouHkjoXNmI0RgXlEm+DSxvNZ6Ed+chjkD422EyY0vWHLGGB1NgDe
zsTAH5Z8w/CPiI/tLGt3wCzZpm8+0V5Mf4wkifKVNF34RCBsKRuueuaHSgJVsaeomvAwFS
czFzWFBSVLWgk8RLAXtfXhIlvKDHZXqvGv3sjaEEgdaS2Z3s70SCPmi754A84WoIiGgh/j
HSLe22GXaw3asio/5AfoZg+4zdP2tFF1BckSbiUMek5J5zJelZOYvq2EC7Qx/kb7No5DA1
u4QMwSz3sQAAA9iLdbopi3W6KQAAAAdzc2gtcnNhAAABAQCsVuCixJg7OAJSs0Q2pr0/Gr
MGg8vEPYH7aozK1Xy1MzzxW3sYjNlolY26ttu+4Q4OHh0k2i4eSOhc2YjRGBeUSb4NLG81
noR35yGOQPjbYTJjS9YcsYYHU2AN7OxMAflnzD8I+Ij+0sa3fALNmmbz7RXkx/jCSJ8pU0
XfhEIGwpG6565odKAlWxp6ia8DAVJzMXNYUFJUtaCTxEsBe19eEiW8oMdleq8a/eyNoQSB
1pLZnezvRII+aLvngDzhagiIaCH+MdIt7bYZdrDdqyKj/kB+hmD7jN0/a0UXUFyRJuJQx6
TknnMl6Vk5i+rYQLtDH+Rvs2jkMDW7hAzBLPexAAAAAwEAAQAAAQEAkTpI5IEc89JYCs7s
bc2G7rWWJahMv1tBvNdmO8s54wyBj7aSffa7gul8XNqZRTor+POhhZuif3za6tuZ8vIFdL
3LvRgzwxCI+u24FkNkMqKuroSKsvVaR7QX3sRHwCltve2dNPcTowGF2btUNWSm22lwKLHn
S/mcvlthJ2ExrrVHl5fDPzHFcUAZ6Vk8IJjkbBUV05FhSGIVHeXBb4wx6ercmfKIs3migf
4KB1W2QYdBF4zTiBikIMW3EoB9oOkzQIIG/3mfH9G96C3Eh8Iai7ptndcHKgh6VWm6iVSx
9Gd7Z8Qy5ymfKbCibRUGiU48QAunC+g05alUHb0QGeD2UQAAAIAS1BWz7MMvBcAqemFGNj
U56dgXaLVP2oFu9rvm1QYd9Z5JhoYaMQLy5WjkO613CRFhaKJ6TiuXc+kVfQed2E4lHCrw
fZDK/5paOW2PiZO+xWTqZwuFs7RqgvLU8c9zTtbOMGxj0woBzX2uL6YEyjsadFZ8kJmTxX
AXc83TqXg42QAAAIEA2WCzNxCYgkYhFgq0m1AUS0THQxHAchtBT7eBbQZRuyM3l4TBqQSV
rJfUuQuSUjmPsr4VVYPFOtQXcS1ZBpf9TYTHWcn57c6UI5emd20PFfNkHXkbjPVd8ztjgY
KidlpZZVnhOLyo5EBfZs1WtWcVI170TjepXVpMhGp7MkcYMKUAAACBAMr1oiQMtd3vhIDH
nMvSrtpocEVKIV0ZVEmXl7/P+xmObAkc/Eury/I62JA+DW2fGIXmD09lLHYs6bbccE/amP
ANzl52ldcBqzZke2NszjsssAc8OTOS2xcZrDu8LTR3+q3/KFgf8mB1Jkj3mOeE7D9xEGnf
upJiKILSsg+IupEdAAAAImNhY3R1c0BjYWN0dXNzLU1hY0Jvb2stUHJvLTIubG9jYWw=
-----END PRIVATE KEY-----