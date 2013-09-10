Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id D59AC61563
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 09:44:56 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so4826340vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 02:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/TYlb/SgStfKLFEl3iDQo6agWpv/6rYXlXfIoquMsT4=;
	b=gQbzxlcoCS90XH1bUDOIo1JInf7QV9VbFwdOPSGbHx3jKkmsr93fPCpkMzLWQBYh+g
	9D+Fz87SjSUOwWrbeOkBMcykIXUW8Uk6+7jlTyr2Zx/jMEn2IXkARHXVtQGzrt0KzdpV
	cL58vu19qozm0jv/I//bgLeFIyRFu0sPjFTG02F/GkjrlzMh19xReDSTgREf0kQ6YP1K
	q6yDrF6SH61a4iWDRCDTTGFKRsOKs/AauwT858itrj4XIEiq7KkIICspTzet4Uqztk30
	ojyWMxRmwygpZZtVykNxIhGLiwqNdh3Bl+GUzD3yM32Oxt7ByBfQocF7KVz23GHerwMQ
	VJBg==
X-Gm-Message-State: ALoCoQlOsHjB8+gJGEHwT8L6zc5MwageTnWZ2vEijUDeFLXoPDKzwRUNZuEJzeGOqV7vCvIOvt+9
X-Received: by 10.58.146.71 with SMTP id ta7mr578492veb.23.1378806297931; Tue,
	10 Sep 2013 02:44:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Sep 2013 02:44:37 -0700 (PDT)
In-Reply-To: <cover.1378744742.git.sgw@linux.intel.com>
References: <cover.1378744742.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Sep 2013 10:44:37 +0100
Message-ID: <CAJTo0LY7mQT4mbaKt7BPkExVzc2GP8C3gvi4sLj4OLkXGLOqbw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/23] Post M4 Patch set
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
X-List-Received-Date: Tue, 10 Sep 2013 09:44:57 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2013 17:49, Saul Wold <sgw@linux.intel.com> wrote:
>   qemu: add recommend of kernel-modules for all qemu machines

Martin didn't like this, and Bruce can see the argument both ways.
Please drop this for now.

Ross

