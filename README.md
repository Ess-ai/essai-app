# EssAi App

This is an open-source app for essai. For more info check the organization to get the developer documentation file.

## Getting Started
Please note, in order to use this app, you need to update the API keys stored in the `secrets.json` file located in the `lib` folder with your own keys.

To get started with this app, follow the steps below:

1. Clone the repository to your local machine.

```bash
git clone https://github.com/your-username/flutter-app.git
```

2. Open the project in your preferred Flutter development environment.

3. Locate the `secrets.json` file in the `lib` folder of the project.

4. Update the following API keys in the `secrets.json` file with your own keys:

   - `supabase_url`: Your Supabase URL.
   - `supabase_anon_key`: Your Supabase anonymous key.
   - `openai_api_key`: Your OpenAI API key.

   The `secrets.json` file should look like this after updating the keys:

   ```json
   {
     "supabase_url": "YOUR_SUPABASE_URL",
     "supabase_anon_key": "YOUR_SUPABASE_ANON_KEY",
     "openai_api_key": "YOUR_OPENAI_API_KEY"
   }
   ```

   **Note:** Ensure that you keep your API keys confidential and do not share them publicly.

5. Save the `secrets.json` file.

6. Build and run the Flutter app on your device or simulator.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

Before contributing, please familiarize yourself with the [contribution guidelines](CONTRIBUTING.md) to ensure a smooth collaboration process.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code as permitted by the license.

## Acknowledgements

We would like to acknowledge the following APIs and platforms that were used in the development of this app:

- [Supabase](https://supabase.io): A cloud-based platform for building scalable and secure applications.
- [OpenAI](https://openai.com): An artificial intelligence research lab that provides powerful language models and APIs.
- [HuggingFace](https://hugginface.co): An artificial intelligence research lab that provides powerful language models and APIs.

We are grateful to the developers and contributors of these platforms for their valuable services and support.

## Contact

If you have any questions or need further assistance, please feel free to contact the project maintainer at [leroyroentgen@gmail.com](mailto:leroyroentgen@gmail.com).
