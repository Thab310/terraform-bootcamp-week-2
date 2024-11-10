# Example variable declarations
variable "name" {
  type = string
}

variable "age" {
  type = number
}

variable "is_active" {
  type = bool
}

variable "tags" {
  type = list(string)
}

variable "metadata" {
  type = map(string)
}

variable "unique_ids" {
  type = set(number)
}

variable "person" {
  type = object({
    name = string
    age  = number
  })
}

variable "coordinates" {
  type = tuple([number, number])
}

variable "any_variable" {
  type = any
}

