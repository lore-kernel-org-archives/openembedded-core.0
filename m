Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TcyrU-0005bH-Uf
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 14:36:37 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 05:22:24 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so11505760iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 05:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=dm5Z5abDXMNWNUaoQOj76WMD5zlhY3YrSbPKQeG7oeo=;
	b=KKH8lR9AXRoPscd2FyKr1l5A7DPp3aZSvflHbbfKhWG7ee6vUNjzfUMPP2KzH1z/e0
	FTka/LJqFWstngvakYuf/Oy/ZhHZK6k4nG/HeiOSgOmP4eIE2UG6G3HIk8UlItc6A+T1
	9SQEX9/kjrCHS0dI1QXDAZI1shfTftepa4FUmfRHH7GBJJ8cwV2RobjGxpjsKdmoJsN7
	AfMICP8uy9ArokaXByZ7FbcfUYrkpWkstGbFjzK3jrfKWp+CKHUA7e0dSM1DQ6hoAJBg
	4/sxDe4boj/8IoEw57RX3OYJRaZ5VH9DNwcaAOX+XrBiIUgNToduWLYDJQugBjZR6ff1
	P0Qw==
Received: by 10.60.169.140 with SMTP id ae12mr9081579oec.52.1353936143133;
	Mon, 26 Nov 2012 05:22:23 -0800 (PST)
Received: by 10.60.169.140 with SMTP id ae12mr9081576oec.52.1353936143063;
	Mon, 26 Nov 2012 05:22:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 26 Nov 2012 05:22:02 -0800 (PST)
In-Reply-To: <20121126085909.64b59d37@eb-e6520>
References: <1353334373-16509-1-git-send-email-eric@eukrea.com>
	<20121122111552.77470adb@eb-e6520> <20121126085909.64b59d37@eb-e6520>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Nov 2012 13:22:02 +0000
Message-ID: <CAJTo0La0t4t+tArOcCQodE-LLDFuOr8O_vdS1iveij6P70_6LQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQku3KH5GzCgt+BHv3R0vzhU988fpFfc3NTNa+MQYQZlB4trRJmtBM3JbNiOANIrkFkL6RQCqS69uRHP4cAmTuEMn+sfY6WrBJEtFmaX0GsnvVdNiALAJLj5P5V4Kad+GR61VUEsqechX/mImH35U9NMj/y+JeVop1iva84QdyTH2OI3kT1x12ez5O9ycWOOlXm5164P
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod: fix git repo URL
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
X-List-Received-Date: Mon, 26 Nov 2012 13:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 November 2012 07:59, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Is it possible to merge it into oe-core's danny branch ?

Done locally for danny-next.

Ross


