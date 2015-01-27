Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6378D6A9FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 13:23:30 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id z60so11542859qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TfARoxoqgvEGV7pbQiNS9kwICfCw4KG+Xpa2X4UV+Ok=;
	b=MvVTxp2AlvvsysE3DuhjJNR23IfjF9mJgcRg8uIvsw/IigFfc738s80i7RK35hbnrG
	Ir4v/KQkClV8Ox7HuLrjzD2gubY0OGlICOixNF0yspvR8pziiFE6WGEw7VCo724WemWi
	bp8r+BEEfutNLxgIldF51yJbhltaZyC6aTHDjVWfVGKAXNQ537+7UgWo8Jp/+3rQn52T
	9PIuht28l0nlXL0v72mBJ+Ma5+B+R33QLQyRnh+PJd/jMF2Dav7NceukyEwT2TXq93vR
	Fm6Qa+dmrR7Z0uzvr6uGltHm5BBaR24PEBO9Z0sugh5yQpFHlDbglJeWBOzXGbu/mjfF
	a8jg==
X-Gm-Message-State: ALoCoQnv/So0QijGrWo2mnFMjZdHgaMlmcVd2DH5wj5HvsUI3bgY1yEhpSS7XaLu+5fmvk+DnOog
X-Received: by 10.229.192.5 with SMTP id do5mr1983718qcb.12.1422365008361;
	Tue, 27 Jan 2015 05:23:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 27 Jan 2015 05:23:08 -0800 (PST)
In-Reply-To: <CACS+7ZRh2fq0ot_u6U0B+SGq6uCORnj9_B2shfSEunrwhPnH+g@mail.gmail.com>
References: <CACS+7ZRh2fq0ot_u6U0B+SGq6uCORnj9_B2shfSEunrwhPnH+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jan 2015 13:23:08 +0000
Message-ID: <CAJTo0LaHX+XQRJpj3GbgohScdYaxCLz-2qf-YXCZrTF0tO-3=Q@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: configuration updates
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
X-List-Received-Date: Tue, 27 Jan 2015 13:23:37 -0000
Content-Type: multipart/alternative; boundary=001a11337bfc108ffd050da22903

--001a11337bfc108ffd050da22903
Content-Type: text/plain; charset=UTF-8

On 15 January 2015 at 21:11, Dan McGregor <danismostlikely@gmail.com> wrote:

> Rebase sshd_config and ssh_config with openssh upstream.
> Check for the ed25519 key in the systemd keygen service.
>

Since you sent this master has moved on and this doesn't apply anymore. :(
Can you rebase?

Cheers,
Ross

--001a11337bfc108ffd050da22903
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 January 2015 at 21:11, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":21h"=
 class=3D"a3s" style=3D"overflow:hidden">Rebase sshd_config and ssh_config =
with openssh upstream.<br>
Check for the ed25519 key in the systemd keygen service.<br></div></blockqu=
ote></div><br>Since you sent this master has moved on and this doesn&#39;t =
apply anymore. :( Can you rebase?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11337bfc108ffd050da22903--
