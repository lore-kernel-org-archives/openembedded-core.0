Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UeT7p-0005qB-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:39:58 +0200
Received: by mail-oa0-f45.google.com with SMTP id j6so7776052oag.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=oRBYTk0Eo2HT6WCHF/E+Cemt73qi5mrPCN1FU0xQ3H8=;
	b=Wlf5fMrDw0UbkrrTOSupzvKTGpG3RXYz9H6s+1kodxg0CG+DXNAjZM+3cVsGzH63UA
	iKGZ9qGESiC1SMxLHltHZvH6Xycsrwh+7tG/9mCfLtJSXbd5MOQUnCBPGA+Y6Bxm6h4Q
	1lBxrQdoI5N28kYs9KnFoZzl3yRytLr/pbRqTBaqejbCWxln7SFL4Lckzc9qlzP3nGK4
	buwJ1mU6g8ytgwoOgg56Ig7I7Y7j97lIiDKne9sOwsCIyBMr+uIk7uq7l/CLDOOf1rYU
	Xp0+2o5hZbqt+lLPuCh5TwKGzviA8gpGo5mVX54OoA+9NG8Hql5Rl915/w52RPonxvQH
	OrSQ==
MIME-Version: 1.0
X-Received: by 10.182.40.202 with SMTP id z10mr27414635obk.74.1369066889899;
	Mon, 20 May 2013 09:21:29 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Mon, 20 May 2013 09:21:29 -0700 (PDT)
In-Reply-To: <cover.1369063930.git.paul.eggleton@linux.intel.com>
References: <cover.1369063930.git.paul.eggleton@linux.intel.com>
Date: Mon, 20 May 2013 13:21:29 -0300
X-Google-Sender-Auth: T4GacoYSyHxE0AsoVSi0vMKdFxw
Message-ID: <CAP9ODKpjkaACp937RtWqsP02Ama=HLDSPAG_KDaAMe-8nPi1Ag@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan][PATCH 00/41] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Mon, 20 May 2013 16:40:22 -0000
Content-Type: multipart/alternative; boundary=001a11c32db6a5762304dd28b9db

--001a11c32db6a5762304dd28b9db
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 20, 2013 at 12:58 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> ...
> Bruce Ashfield (4):
>   linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
>   kern-tools: anchor and delimit regexs
>   linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
>   linux-yocto/3.8: udpate to v3.8.11
>

Does this includes the dash kernel-tools fix?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c32db6a5762304dd28b9db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, May 20, 2013 at 12:58 PM, Paul Eggleton <span dir=3D"ltr">&=
lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.=
eggleton@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">...<br>
Bruce Ashfield (4):<br>
=A0 linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes<br>
=A0 kern-tools: anchor and delimit regexs<br>
=A0 linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56<br>
=A0 linux-yocto/3.8: udpate to v3.8.11<br></blockquote></div><div><br></div=
><div style>Does this includes the dash kernel-tools fix?</div><div><br></d=
iv>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_=
blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c32db6a5762304dd28b9db--
