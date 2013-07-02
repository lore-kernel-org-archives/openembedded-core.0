Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4742F61FB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:47:01 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wc20so5592560obb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=1JOKXQEyJs0Pv1UZr919XPZesyrmT/DzPkr1LRU6fUs=;
	b=qoCFuOT3+HOzh7jvMycvklw9vLbOSby8oB75fYcURDDgRWKxooz8soc4D6qUaY+OeG
	aJNr0u8U/TPTUKSvSU3ih5SPWddMoiFo6Dm+AnpC/kf4d7oK7PYlPyEpEMEO9bVy3k0P
	Gp3teKrKXigQN/49/5VZbWC3bZpS4JxkHBaZpDaEK/ZkDEziRs+kSuliUCthG6PZzrEC
	4avRJ8c1+XvFZ0idQuQwWEumTIe48zfnUUFYey6gz93Ic33uw0b9C+8W7oCVMsVKzcwj
	urN+DkQRwjqqgJeXoovZfjjgam1b2DSVc/4RRbH8ygBqR0pN8Ya9mmihi5/WvdJXp6bJ
	Ki/w==
MIME-Version: 1.0
X-Received: by 10.182.72.170 with SMTP id e10mr13444687obv.62.1372776421304;
	Tue, 02 Jul 2013 07:47:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Tue, 2 Jul 2013 07:47:01 -0700 (PDT)
In-Reply-To: <51D2E395.3000300@linux.intel.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<51CB2164.5090102@linux.intel.com>
	<51D2E395.3000300@linux.intel.com>
Date: Tue, 2 Jul 2013 11:47:01 -0300
X-Google-Sender-Auth: CA_0QXlQ1eVUSNJBbmYD-VR_ISU
Message-ID: <CAP9ODKoCt6Gjd3s8wcGy8v0xy3kTQxYdKu1-gjeymN5Ruy59dQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Tue, 02 Jul 2013 14:47:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 2, 2013 at 11:28 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Any updates on this issue?

This is outside my skills :-) Khem did you have time to look at Saul file?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

