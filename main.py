from pathlib import Path

from mcap.reader import make_reader
from mcap_protobuf.decoder import DecoderFactory as ProtobufDecoderFactory


def main():
    with Path("./example.mcap").open("rb") as f:
        reader = make_reader(
            f,
            decoder_factories=[ProtobufDecoderFactory()],
        )

        print("Start processing example...")
        for _, _, _, decoded_msg in reader.iter_decoded_messages(log_time_order=True):
            print(f"Decoded message: {decoded_msg}")
        print("Finished processing example!")


if __name__ == "__main__":
    main()
