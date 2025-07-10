<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f0ce2d470f3efad6f8c7df376f416a4b",
  "translation_date": "2025-05-20T09:28:40+00:00",
  "source_file": "00-course-setup/AzureSearch.md",
  "language_code": "pl"
}
-->
# Azure AI Search Setup Guide

Ten przewodnik pomoże Ci skonfigurować Azure AI Search za pomocą portalu Azure. Postępuj zgodnie z poniższymi krokami, aby utworzyć i skonfigurować usługę Azure AI Search.

## Prerequisites

Przed rozpoczęciem upewnij się, że masz:

- Subskrypcję Azure. Jeśli nie masz subskrypcji Azure, możesz utworzyć darmowe konto na [Azure Free Account](https://azure.microsoft.com/free/?wt.mc_id=studentamb_258691).

## Step 1: Create an Azure AI Search Service

1. Zaloguj się do [Azure portal](https://portal.azure.com/?wt.mc_id=studentamb_258691).
2. W lewym panelu nawigacyjnym kliknij **Create a resource**.
3. W polu wyszukiwania wpisz "Azure AI Search" i wybierz **Azure AI Search** z listy wyników.
4. Kliknij przycisk **Create**.
5. Na karcie **Basics** podaj następujące informacje:
   - **Subscription**: Wybierz swoją subskrypcję Azure.
   - **Resource group**: Utwórz nową grupę zasobów lub wybierz istniejącą.
   - **Resource name**: Wprowadź unikalną nazwę dla swojej usługi wyszukiwania.
   - **Region**: Wybierz region najbliższy Twoim użytkownikom.
   - **Pricing tier**: Wybierz poziom cenowy odpowiedni do Twoich potrzeb. Możesz zacząć od darmowego poziomu do testów.
6. Kliknij **Review + create**.
7. Sprawdź ustawienia i kliknij **Create**, aby utworzyć usługę wyszukiwania.

## Step 2: Get Started with Azure AI Search

1. Po zakończeniu wdrożenia przejdź do swojej usługi wyszukiwania w portalu Azure.
2. Na stronie przeglądu usługi wyszukiwania kliknij przycisk **Quickstart**.
3. Postępuj zgodnie z krokami w przewodniku Quickstart, aby utworzyć indeks, przesłać dane i wykonać zapytanie wyszukiwania.

### Create an Index

1. W przewodniku Quickstart kliknij **Create an index**.
2. Zdefiniuj schemat indeksu, określając pola i ich atrybuty (np. typ danych, możliwość wyszukiwania, filtrowania).
3. Kliknij **Create**, aby utworzyć indeks.

### Upload Data

1. W przewodniku Quickstart kliknij **Upload data**.
2. Wybierz źródło danych (np. Azure Blob Storage, Azure SQL Database) i podaj niezbędne dane do połączenia.
3. Przypisz pola źródła danych do pól indeksu.
4. Kliknij **Submit**, aby przesłać dane do indeksu.

### Perform a Search Query

1. W przewodniku Quickstart kliknij **Search explorer**.
2. Wpisz zapytanie wyszukiwania w polu wyszukiwania, aby przetestować działanie wyszukiwania.
3. Sprawdź wyniki wyszukiwania i w razie potrzeby dostosuj schemat indeksu lub dane.

## Step 3: Use Azure AI Search Tools

Azure AI Search integruje się z różnymi narzędziami, które rozszerzają możliwości wyszukiwania. Możesz używać Azure CLI, Python SDK i innych narzędzi do zaawansowanych konfiguracji i operacji.

### Using Azure CLI

1. Zainstaluj Azure CLI, postępując zgodnie z instrukcjami na stronie [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?wt.mc_id=studentamb_258691).
2. Zaloguj się do Azure CLI, używając polecenia:
   ```bash
   az login
   ```
3. Utwórz nową usługę wyszukiwania za pomocą Azure CLI:
   ```bash
   az search service create --resource-group <resource-group> --name <service-name> --sku Free
   ```
4. Utwórz indeks za pomocą Azure CLI:
   ```bash
   az search index create --service-name <service-name> --name <index-name> --fields "field1:type, field2:type"
   ```

### Using Python SDK

1. Zainstaluj bibliotekę klienta Azure Cognitive Search dla Pythona:
   ```bash
   pip install azure-search-documents
   ```
2. Użyj poniższego kodu w Pythonie, aby utworzyć indeks i przesłać dokumenty:
   ```python
   from azure.core.credentials import AzureKeyCredential
   from azure.search.documents import SearchClient
   from azure.search.documents.indexes import SearchIndexClient
   from azure.search.documents.indexes.models import SearchIndex, SimpleField, edm

   service_endpoint = "https://<service-name>.search.windows.net"
   api_key = "<api-key>"

   index_client = SearchIndexClient(service_endpoint, AzureKeyCredential(api_key))

   fields = [
       SimpleField(name="id", type=edm.String, key=True),
       SimpleField(name="content", type=edm.String, searchable=True),
   ]

   index = SearchIndex(name="sample-index", fields=fields)

   index_client.create_index(index)

   search_client = SearchClient(service_endpoint, "sample-index", AzureKeyCredential(api_key))

   documents = [
       {"id": "1", "content": "Hello world"},
       {"id": "2", "content": "Azure Cognitive Search"}
   ]

   search_client.upload_documents(documents)
   ```

Więcej szczegółowych informacji znajdziesz w następującej dokumentacji:

- [Create an Azure Cognitive Search service](https://learn.microsoft.com/en-us/azure/search/search-create-service-portal?wt.mc_id=studentamb_258691)
- [Get started with Azure Cognitive Search](https://learn.microsoft.com/en-us/azure/search/search-get-started-portal?wt.mc_id=studentamb_258691)
- [Azure AI Search Tools](https://learn.microsoft.com/en-us/azure/ai-services/agents/how-to/tools/azure-ai-search?tabs=azurecli%2Cpython&pivots=code-examples?wt.mc_id=studentamb_258691)

## Conclusion

Pomyślnie skonfigurowałeś Azure AI Search za pomocą portalu Azure oraz zintegrowanych narzędzi. Teraz możesz eksplorować bardziej zaawansowane funkcje i możliwości Azure AI Search, aby wzbogacić swoje rozwiązania wyszukiwania.

W razie potrzeby odwiedź [Azure Cognitive Search documentation](https://learn.microsoft.com/en-us/azure/search/?wt.mc_id=studentamb_258691).

**Zastrzeżenie**:  
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż dokładamy starań, aby tłumaczenie było jak najdokładniejsze, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w języku źródłowym powinien być uznawany za źródło wiarygodne. W przypadku informacji o kluczowym znaczeniu zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.