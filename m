Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id B51DA6968F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 13:42:04 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id wz12so1718571pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=0LOnLhxtcRk8NX12IimGUf6+ojp0DmlDY9EgNyC3RLg=;
	b=fbQeFHPNPVM+ka+krkYkm1iqeN2kPadhChCoMxiW5XIzw4gSkNCgkGAmrxCSju6BSZ
	+tv6MRmP6R6K/mwI0ZxOnz5dOILsfItMmjaaF9XnCE5f/uoDewcICMr2f7QEUtp4hyqv
	TyWOFWUvfEY5K9NsP64KN65QXXkzjmAY2h7XruBHDdYaGD3zug7ftavzO7rVMzYiP86M
	f77ma9DZjyQy5+nHXKRGcLWCuCot+BoHefx2REYUsX3UATXUjT5Rq/rskmHJ6vrD9Ro1
	c0xFiidoEj/UpR12ft8bke+imj1enZJaLY0hw5gseV+XVQk5h+xbSjiPQvaeU+3+lupo
	aqPQ==
X-Received: by 10.66.197.136 with SMTP id iu8mr8617293pac.0.1369230125833;
	Wed, 22 May 2013 06:42:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.100.104 with HTTP; Wed, 22 May 2013 06:41:45 -0700 (PDT)
In-Reply-To: <CALbNGRQPq9X0JiooyTz11i+-v8zpUHCVWO3R4qzPr3tyJgmKnQ@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
	<CALbNGRQPq9X0JiooyTz11i+-v8zpUHCVWO3R4qzPr3tyJgmKnQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 14:41:45 +0100
Message-ID: <CAJTo0Lbt=0TpSzLRDXRH=_ndnGKN0k17cwQnpnv=fBwbB-N-jw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlncyXJDcjhc0CYyhp4eve2j9iEoVsbwOH/xxzlE+hvJUh3QOgyLUu0a+ZqdVCCBDaLvR2i
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 13:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 May 2013 12:01, Andreas M=C3=BCller <schnitzeltony@googlemail.com> wr=
ote:
> Haven't found at-spi2-gtk. Do you mean at-spi2-atk?

Yes, typo, sorry.

Ross

