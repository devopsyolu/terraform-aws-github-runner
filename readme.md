# Philips Lab Github Runner Projesi

Bu proje, GitHub Actions iş yüklerini AWS üzerinde otomatik olarak yönetmek için **GitHub Runner** altyapısı oluşturan **Terraform** modüllerini içerir.  
Temel olarak [github-aws-runners/terraform-aws-github-runner](https://github.com/github-aws-runners/terraform-aws-github-runner) deposundan uyarlanmıştır, ancak daha basit ve özelleştirilmiş bir kurulum sağlar.

## Özellikler

- **AWS üzerinde GitHub Runner’lar**: Terraform ile otomatik olarak EC2 örnekleri üzerinde Runner kurulumu.  
- **Otomatik ölçeklenebilirlik**: İş yükü bittiğinde Runner’ları kapatır, ek maliyeti önler.  
- **Basitleştirilmiş yapı**: Kişisel veya küçük projeler için sadeleştirilmiş Terraform ayarları.

## Ön Koşullar

1. **AWS Hesabı**: Yeterli izinlere sahip bir IAM kullanıcı hesabı.  
2. **Terraform**: 1.0.0 veya üzeri bir sürüm (önerilir).  

## Kurulum ve Kullanım

https://github.com/jonico/awesome-runners buradaki runner yaklaşımları arasında yer alır.

cd lambdas-download
terraform init && terraform apply

cd ../multi-runner
terraform init && terraform apply