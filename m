Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id B560A6EAB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:16:58 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so6166876igb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cEa+uEGAY/at80geZAhcyoCyVXQqsdHye4CZ3KR/4ic=;
	b=nSR1eVwkrNb+CXad7emhQx9jTMFDVNh2KF0TbA9CynLI5+PU3j+MK7BiQl2E49ab4A
	JXLIU0m7mtIYa26SPh1amVUwWZ2KmOohNb/HnfZI6wooI4DnYloka7HAGVA28q0bYgU6
	XDeFbJrirWttQ66Uha0YNWlGVrdYR83IX3QGooCJSMUjQygRkUvnRXH22VBQX6SSGIkq
	YptJAaxHxBx5t723nwKyh8E7ejm6e9JyuQ86O+HAqGPR3nyZ4/La4FI7i4AUv3CUUO2i
	Hq9ewV1JtdzD7U66TE1xVWj6LeUOtcTFRX7cSogVm31yNbW9QMdz33jvDyYeJrfHQHON
	+/zg==
X-Received: by 10.42.20.193 with SMTP id h1mr2723928icb.70.1394824619973; Fri,
	14 Mar 2014 12:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 12:16:29 -0700 (PDT)
In-Reply-To: <CABcZAN=z8mB1LkJ05SmTk6Gg+UJgp2+-yQNWKNwNPpvHcdrVtQ@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
	<CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
	<CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
	<CANyK_8ex42HU9pDjkMri4vCs7hyGQTSk4eZ_dB25NXSXRY3JSA@mail.gmail.com>
	<CABcZAN=z8mB1LkJ05SmTk6Gg+UJgp2+-yQNWKNwNPpvHcdrVtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 12:16:29 -0700
Message-ID: <CAMKF1srjEOYoNoT5T3weMkKSKN3MNPTnqCVbfXgR9RHn=erxmA@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Mar 2014 19:17:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 12:13 PM, Chris Larson <clarson@kergoth.com> wrote:
> You'll be amazed how many headaches you can save having the host environment
> be a known quantity :)

absolutely
I cant agree more.
-Khem

