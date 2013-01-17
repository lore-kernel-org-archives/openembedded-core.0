Received: from mail-la0-f45.google.com ([209.85.215.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvrYb-00027n-Kt
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:39:10 +0100
Received: by mail-la0-f45.google.com with SMTP id ep20so2750477lab.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=CglLxffALrL9zFLKVmPyDHW+NcDa7DfAvMiH0oGN62Y=;
	b=wlqbCtcyitMv69ZcJ/k73Vl6CnMAcS08DNqkTrxHOIrBcZSRdvkoj1z3GKedYihncg
	pR6cagVsgXvYGig/4YoZ314nIRfOCnpqPoVu29sX5GcA3hvuVM67UHVD+Tes9XQsMB+u
	G6hFI1/qPIRgNxeKFNG6NKmfyHQOpx1JICZ6ukgaKylN9z0Ls7+eZNzoTEpcZ47y4TYr
	nlhNb3Tinc19uK0Yos83e4Ibi3d3pJb3viI6KdFOF2S+wFN7bljZvGUE56RDlMWYbfYj
	5//bkRYA15tBMto/snRhCi2FWF/M/uUy/n/lfmrpxt1EmdODrV8YuT2RUNDI4u/xXCJl
	J2MQ==
X-Received: by 10.112.49.202 with SMTP id w10mr2337881lbn.2.1358436226441;
	Thu, 17 Jan 2013 07:23:46 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 17 Jan 2013 07:23:26 -0800 (PST)
In-Reply-To: <50F816C9.5000504@communistcode.co.uk>
References: <50F816A8.4080508@eumx.net> <50F816C9.5000504@communistcode.co.uk>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 17 Jan 2013 08:23:26 -0700
X-Google-Sender-Auth: g9_hihz_8mamNfr8ELn6TO2Nbbk
Message-ID: <CABcZANn4fZGec9P3siPCSGWONP9p6gpW+U+s2JWyHcpq1Fc+YQ@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: lttng-ust issue
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
X-List-Received-Date: Thu, 17 Jan 2013 15:39:10 -0000
Content-Type: multipart/alternative; boundary=bcaec554daa2ba20ee04d37d94da

--bcaec554daa2ba20ee04d37d94da
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 17, 2013 at 8:20 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On a build today I was hit with this error. I am at commit
> 169b9afcf2d357fdcf254a380d21d1**7701685834.
>
> |  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
> file
>

Don't install lttng2-ust :) It no longer exists.
-- 
Christopher Larson

--bcaec554daa2ba20ee04d37d94da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 17, 2013 at 8:20 AM, Jack Mitchell <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ml@communistcode.co.uk" target=3D"_blank">ml@communistcode.co.u=
k</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":o2">On a build today I was hit w=
ith this error. I am at commit<br>
169b9afcf2d357fdcf254a380d21d1<u></u>7701685834.<br>
<br>
| =C2=A0* check_data_file_clashes: Package lttng2-ust-dbg wants to install<=
br>
file</div></blockquote></div><br>Don&#39;t install lttng2-ust :) It no long=
er exists.<br>-- <br>Christopher Larson</div></div>

--bcaec554daa2ba20ee04d37d94da--
