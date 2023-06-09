% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_SNGAN.R
\name{fit_SNGAN}
\alias{fit_SNGAN}
\title{Title Fits the model on data yielded batch-by-batch by SNGAN}
\usage{
fit_SNGAN(
  generator,
  discriminator,
  n.discriminator = 5,
  batch = 25,
  epoch = 500,
  learn_rate = 1e-04,
  object = NULL
)
}
\arguments{
\item{generator}{A generator (e.g. like the one provided by flow_images_from_directory() or a custom R generator function).
The output of the generator must be a list of one of these forms: <br> - (inputs, targets) <br> - (inputs, targets, sample_weights) <br>.
 This list (a single output of the generator) makes a single batch.
 Therefore, all arrays in this list must have the same length (equal to the size of this batch).
 Different batches may have different sizes. For example, the last batch of the epoch is commonly smaller than the others, if the size of the dataset is not divisible by the batch size.
 The generator is expected to loop over its data indefinitely. An epoch finishes when steps_per_epoch batches have been seen by the model.}

\item{discriminator}{network for authenticity}

\item{n.discriminator}{Integer.Number of cycle for discriminator in each epoch}

\item{batch}{Integer.Number of samples in each training}

\item{epoch}{Integer. Number of epochs to train the model
An epoch is an iteration over the entire data provided,Note that in conjunction with initial_epoch,epochs is to be understood as “final epoch”.
The model is not trained for a number of iterations given by epochs,  but merely until the epoch of index epochs is reached.}

\item{learn_rate}{float >= 0. Learning rate.}

\item{object}{RNAseq matrix}
}
\value{
epoch, gloss,dloss, pearson correlations
}
\description{
Title Fits the model on data yielded batch-by-batch by SNGAN
}
\examples{
\dontrun{
library(keras)
library(reticulate)
library(tensorflow)
library(bulkGAN)
library(Hmisc)
tfa <- import('tensorflow_addons')  #   import tensorflow_addons model

fit_SNGAN(generator, discriminator,n.discriminator=5,batch=25,
           epoch = 500,learn_rate = 0.0001,object = normal_bulk )
}
}
