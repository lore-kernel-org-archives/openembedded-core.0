Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 380EE6B03A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 16:46:47 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so3013944vbg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=YLrAk3Trj8VzTHdvsCjGN+WiovsTMtf37/5T8m/kaBc=;
	b=FZwehAdldVkajcRfEJjL6O/8Dt6mag0ZoUXI9IIRL2Fwn8FsRdzt5fApmR+kc9+4+B
	VcFec4wFaMsO164Lzdy0vBcbSUWGpPWlXp4nDK0iOESKQ4o7VsOr+yA/JtxHJOhDE0tx
	Y8plPdiBodCmcD+6r+i39a9Ysw0iNaG/ksrQBx7MkCyzKPOvt8a8m4Y4IVFf7oag0VZx
	AAF+FPLi/LKEledqI2uZZJTSPc8txNjkKT4AoV6h16dLRt23qCPnlaoipFPpxvLbMRIh
	xsQ4ciskepR3NTxAaJejuqaSlgGntn5n4g5tahfSCryZswomwHGeFmQpV7dYXwHmfNLd
	84Dw==
X-Received: by 10.58.233.8 with SMTP id ts8mr25700711vec.44.1375116407482;
	Mon, 29 Jul 2013 09:46:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 09:46:27 -0700 (PDT)
In-Reply-To: <cover.1375112939.git.sgw@linux.intel.com>
References: <cover.1375112939.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 17:46:27 +0100
Message-ID: <CAJTo0LZH1WHnWsr97SJG37vcbyiPkveuJwx7T4n_qLx9vNLiAQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQme7iIyg+OzxWvGIvWDOUJ8Psw6a1GZCShqYyYe8M0jn+cK8+YOEg1LFgkgTPD0hdLVlNCK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/14] Fixed again
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
X-List-Received-Date: Mon, 29 Jul 2013 16:46:47 -0000
Content-Type: text/plain; charset=UTF-8

On 29 July 2013 16:51, Saul Wold <sgw@linux.intel.com> wrote:
> Clearly having a bad morning!

Join me in the Need More Coffee Club...

> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
>
>   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

