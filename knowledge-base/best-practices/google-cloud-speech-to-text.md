# Google Cloud Speech-to-Text Best Practices

**Source:** https://docs.cloud.google.com/speech-to-text/docs/best-practices

## Executive Summary
This guide outlines the recommended strategies for maximizing accuracy and performance when using the Google Cloud Speech-to-Text API. It covers critical audio recording standards, processing methodologies (real-time vs. batch), and configuration tuning to ensure optimal transcription results.

## Key Takeaways

### 1. Audio Quality Recommendations
*   **Sampling Rate:**
    *   **Recommendation:** 16,000 Hz or higher.
    *   **Avoid Upsampling:** Do not artificially increase the sampling rate (e.g., from 8kHz to 16kHz); send the audio at its native rate.
    *   **Configuration:** Use `explicit_decoding_config` for headerless codecs to specify the native rate. For headered files, use `auto_decoding_config`.
*   **Encoding:**
    *   **Lossless:** PREFERRED. Use **FLAC** or **LINEAR16**.
    *   **Lossy:** AVOID if possible (MP3, AAC). If bandwidth is constrained, prefer **AMR_WB** or **OGG_OPUS**.
    *   **Preprocessing:** Do **not** use Automatic Gain Control (AGC) or noise reduction processing before sending to the API.

### 2. Processing Strategies
*   **Streaming Recognition:**
    *   Used for live audio (microphone input).
    *   Audio is split into frames and sent via `StreamingRecognizeRequest`.
    *   **Frame Size:** ~100ms is the recommended balance between latency and efficiency.
*   **Batch Processing:**
    *   Use for existing audio files (short or long).
    *   Select the appropriate mode: `transcribe-short-audio` (< 1 min) or `transcribe-long-audio` (> 1 min).

### 3. Configuration & Accuracy Tuning
*   **Model Selection:** Always specify the correct `model` (e.g., `command_and_search`, `phone_call`, `video`) and `language_codes`.
*   **Adaptation:** Use **Phrase Hints** (Speech Adaptation) to boost accuracy for specific domain terms, proper names, or jargon that might be out-of-vocabulary.
*   **Features:**
    *   **Automatic Punctuation:** Enable for more readable transcripts.
    *   **Profanity Filtering:** Enable to mask inappropriate language.
    *   **Speaker Diarization:** Use to distinguish between different speakers in the same audio track.

### 4. Microphone Placement
*   Place the microphone as close to the speaker as possible.
*   Avoid capturing multiple speakers on a single channel if possible; multi-channel (separate tracks per speaker) yields better results.

## Relevant Resources
*   [Speech-to-Text Documentation](https://cloud.google.com/speech-to-text/docs/)
*   [Client Libraries](https://docs.cloud.google.com/speech-to-text/docs/client-libraries)
*   [Pricing](https://cloud.google.com/speech-to-text/pricing)
