## Concept Check: Advanced Segmentation

### Question 1

Assume you are trying to combine two masks. Which of the following operators can you use when combining the masks?

- **or (|)**

> You can apply the "or" operator on two masks using "BW1 | BW2"

- **And (&)**

> You can apply the "and" operator on two masks using "BW1 & BW2"

- All (:)
- At (@)
- **Not (~)**

> You can apply the "not" operator on a mask by running "~BW1". This will invert the mask.

### Question 2

Below are two chips masks from the "Combining Multiple Masks" video, which we will refer to here as "MaskLeft" and "MaskRight". How might you combine the masks to get only the background pixels? Select all that apply.

![1](./images/1.png)

- `~MaskLeft | ~MaskRight`
- `~(MaskLeft | MaskRight()`
- **`~MaskLeft & ~MaskRight`**
- **`~MaskLeft & ~MaskRight`**

### Question 3

Consider performing clustering on an image with blue and red objects on a black background. How many clusters should you specify when using `imsegkmeans` function?

- 2
- **3**
- 4
- None of the above. The `imsegkemans` function automatically chooses a value of K.

> You need to differentiate the red and blue objects from each other and the background.