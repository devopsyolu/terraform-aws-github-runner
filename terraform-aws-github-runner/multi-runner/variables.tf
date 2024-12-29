variable "github_app" {
  description = "GitHub for API usages."

  type = object({
    id         = string
    key_base64 = string
  })

  default = {
    id = "1098456"
    key_base64 = "LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFb3dJQkFBS0NBUUVBMDNNSDEyTnBTck5JOVhmV3E4R0xaTC9tQi95V2ZKZTVvTWE5Z3hjN1NwNmVCSGVQCkdiNHVrL0VOQVFJdzI1aWtRYnJXOVVmVW1ESk40NjJSWUM2MGw1aTY5b05rMElFTmhCeFpyNXM4ZERDOUJsSncKcXN4dzZaaHBkMzRkNkhkY3lxQmRsS3NIWmhlWjRNSXpGdDU2OFVnWDNIR0FHV2FWM21FVXJBQXRhWUNkUGpneApmY0RuYjFrN0RaYUpRVFJjUWp6T0dGaXBKbXFiVlBOWlN4MXM5MG9qQ0lFQ1BrZEZWSVBVZjJHMllDZEdaaC9qCjc0S1R1RVJ6L3FYaXAwYzdBVy9WUkZpOVljQ0ZSamVHaXVUOW5JNHZZU1ovWmo5ekkvRi9jbGpydHJNOEkwVk8KWlo2R0EyVW1XaFdINWhmRHM4aTlVVFpHbkpvQjJPVkVpNjF3MndJREFRQUJBb0lCQUE1WFpmZkE0VnBVc0tVZApmS3pua3FuQnJqdHFjVlovLy9JY3FLdmtmbndBS0IyTGNtUS9sdThuMFViNVBCRVkyRU14QmZWYTZ0dHJ4Z2FrCk5oRDgrZml5UGpRTUUyRms3MksvZllIQW1LZ1V5aTFNbUNHdGZoY0o1RlZiYzNIWjdxdzdsajFJSUZkWFVIT0QKR0czN3B3RUliNzNlNE41WUsrQUtXNW1TNVlHYlBPNkxRZHpIUEt0Qy9vY1ptUjhZWmRnSU5ySTBndVNrVng0ZgpheGZxWXM2RW1zUno0dFhscThhcGJmR3ErVHVmY0c4NmxxajM3SEFLcTBwWTdLcy9sdStlYjg0Ymh2VTQybXVjCmQ3S0xZcXk1QUhGYUNtOE8ydGlML3hiVGFISDFsenJ1WlRwNHJKQ3lMNjY2bjdTdTd1Y2E1dmVZM0t3Z1lFV0MKeGNVQ3JLa0NnWUVBK0R2OUN3akUzbzBKS3NNN2tJWUVIN3U1UGYvL1hQVVZVcTJaTmlvZTNRR0dTbklVRmV2OQpIL0FBdkc0N0NGYXVaOGg1aDR4NHFSbDhWRWVoM0l1bnppeWFHVnB5ekpKcGk3M2JEeFdtR1F6WjUvZGFTSUFyCnBKZjU5WmN2T0JSQW03V0NnUUdaby8xakpkcUpnSXZZRFlrMEZ1NXR6NlAzR0VpSGRrdkc0MDBDZ1lFQTJoQnkKRWdKdFBJUWNQZ09DUzNPK1VrVlF5QnZabTlXd2hrOFd6SDExOTl6ck9Sd2VTdGY5cm9COWg3dmNaQTJ4LzVQNQpFZzloWUdaRzdKSlJGUU8wOUVjVDJpMFhBWWE1NGRYVWVPV3BmQVl3OVRVK3gyUzFFbnV0WVVOdlVOZDlHUDkrCkJ2MjlhSHM1TmkzNldmc0MzQjRtMzdneitaZWx0aVBiNnZGOXdNY0NnWUVBdWZNT0FlY0d1b1BCMnpPMmVmTzYKUVI4NWk1VXA4TE55enFWV1FQbmFkc20rbENQU29mMU9kMDhzN2ZwUTVGVXlmbkh4ZjdXZGFXYTYrTk5VRDhiWgo1QnNMTUhUTnpDcmRQNTN2NitQV3Nhc3J6SlZCSDFCTDRSY3JXbXB2Sjc0Y0M4Z3pRM28wWW1EY2xhMllGU0FzCnJ5OFpReGhHVUNYT1luVnFiQllsblgwQ2dZQnR2R0RyRnpXSmdxSUR3eGhLaUJCNnJrOGNwSWM1bUt1Z3F5UTUKKzlqbHh0TElocEhuOEJIRlF2dm8xbXp1SE1ZNmEyaW40ZjJLMlcxUGw4SWQ1U09tMmkzdldVbCtoeUg3dC9PWQpjMXA3QTFLWDB4ZW9sOUZYWDgyOGFJY1lFNWpzZjRZWVZwQitoNlFlMDd4c2s1aTQxS09UYWNzZUMyWms1bDdCCk9JMmorUUtCZ0Z1ZWZSZHJGRjc1TDBjcVFlc01lekkrTmQ1RDJrOVFxN0d0U2gxcWdrUTF0a2JLdHJMQ3EzUjQKTm4rSnZxWnVOc251RngyUmI0SEVLeHJ6Vk1sZnlvZms2K3pxSWd4QzNta0V5K056anpla3BGUGpiZlZ4N3JTNQpUN3ByMysvTW5IbExqZ1NJNDhBV1dZQU8zN05aQUx6OVgrVWRSakMxV2FkVEFiYlF6aXY2Ci0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0tCg=="
  }
}

variable "environment" {
  description = "Environment name, used as prefix"

  type    = string
  default = "runner"
}

variable "aws_region" {
  description = "AWS region to deploy to"

  type    = string
  default = "eu-west-1"
}
