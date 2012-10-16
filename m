Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TO7ic-00007Y-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 16:02:03 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 16 Oct 2012 06:48:21 -0700
Received: by mail-ob0-f175.google.com with SMTP id eq6so6214184obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 06:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=TNdxdMH6kZKe7cOhCH8/Bdcu76XVPvQl5DHWsyuVCjw=;
	b=jRjaFWK02uG/6smOjF1v6vgvgLPmZeE5vzw19M1seIe/e3fXFEMOeF6JHYp1L+2AYi
	I9HYhECK24dzY840jDrwwK+vO/pxaZV8HNb2nf00RRHUYDYA35cl7fUHhWs05JEdT+GG
	NbSTHNs7i/pOKYS2J28Se2EUH6t/P+bLoL38Gb9c6rbkp20sUG9GQCi22sZhtNI2GoYH
	kj2HLPck3RmdUtTLHRk6SekTOd2yVwihsyxJUbIsg3f/UmJgsLJjf5C5ksLLvwLhkw+a
	kLHoQxvD4FqCh8sxvOyWd3cyw+RFLC1/RO07vztKxqJ+Jdi0cYVQGZaE2Mxo2/7d7WJw
	RYCg==
Received: by 10.60.171.69 with SMTP id as5mr12647342oec.100.1350395324130;
	Tue, 16 Oct 2012 06:48:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Tue, 16 Oct 2012 06:48:23 -0700 (PDT)
In-Reply-To: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
References: <1350394101-15120-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2012 14:48:23 +0100
Message-ID: <CAJTo0LZ9RCivuOU039+Sq0ijD_Puor+=w6E1rtPVPZHARZGZqg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQlXFmJJxfSBamReqVus9vQUNkK9OhYaz8KHs+WKuTUwsi78oQl+QaWVAPNN38xN64ch/Wla
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] gnome-icon-them bugfixes
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
X-List-Received-Date: Tue, 16 Oct 2012 14:02:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 October 2012 14:28, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> It caused me a lot headache to load gtk-stock-icons...
>
> Andreas M=C3=BCller (2):
>   gnome-icon-theme: fix icon mapping
>   gnome-icon-theme: remove unused configure variable

Ack.

Thanks,
Ross


