Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2ce-0004pG-A3
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 13:30:05 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so1712832veb.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=yLyKyDJp8RgWo/n5Ue78dkn8cqdl1sGUp4qXt+CuDKo=;
	b=D+hKVAUD36IGJBiopLKtztdd5U8NYpMbr2Zs38zLNBK28dvZkoNHy2W8yvNdWQ2vkF
	2Xi8o7gVnthxB9bYV3fC88P0QfkWkgetP/rTdFEHVdE3Y9bwI7nur+Yb+AGYOkLrYHQl
	vtxhdhPBvqyJqh/Ui743G3KWScyYRALe8h26bn21c1YnJ/aRd1df7TZ5HbO+sbWHgvTr
	B02ZrTM94c2riqfhb7rDFMrqidSOz3k2HyT1O0KS2MYHOA7bYCbtt1xOZXynAzmbKaPp
	QKChdEAFocsDRGyUsabwAs9QMCAj+/48kZFMgyW4fVO0nUC8CUlUdqYTvt4fArDVuBqE
	dUEw==
X-Received: by 10.220.215.73 with SMTP id hd9mr2450514vcb.19.1362053618505;
	Thu, 28 Feb 2013 04:13:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 28 Feb 2013 04:13:18 -0800 (PST)
In-Reply-To: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
References: <CA+YB3raWk13+Yxj3=8c34Lbm3svv6apkp9BeYgjRgBnt_4JbUA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Feb 2013 12:13:18 +0000
Message-ID: <CAJTo0LaiKyUHD4C6KhdyOjuPLtMb+BvpaRwcEXALY7cPd2tNLw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnOxlX+Asej2iZGLgvY80NgXiwN7w+X/MeaR34aJ+o6EbHhzrCfZ7Dv8j5momhrZg51ak3I
Subject: Re: OE TSC minutes 12 February 2013
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 12:30:08 -0000
Content-Type: text/plain; charset=UTF-8

On 28 February 2013 06:28, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> (9:51:16 AM) RP: bluelightning: Beat up Ross?

In an attempt to avoid TSC-sanctioned beatings, I've just sent a
series that adds libgdata, clutter-box2d, and gthumb to meta-oe.

Ross


