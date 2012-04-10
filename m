Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHcvs-0006F0-97
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:24:36 +0200
Received: by wera1 with SMTP id a1so3284449wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 08:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=CipXjoxO372+Dl9G6JafuE4v16TGEO7RZj8i768z9EI=;
	b=XjTROmCnCCw2LqIxrz5di/+EOQ8tqMqWfmcVnEgi9iAAZ9mRL07r7qa6FfBed4gsIs
	2bQ0JTDyn1eH2+xFTU18+pVscM0gyON6Zp3EIK8jFEBEXQb2Irnq5Yi3c/1nNO/tUGuU
	hR4Tk40/lt4P54k9og25SaLSWEmEXc9F3JowbkcJWJ4qQi4iviBSPsg7zAS6dhQdyxCl
	lJcBCNbqwTo6LVJJ0nGqtEzfKukguoX2r13kE3Q8cm6BEM69RVmNEqK1JQuMkJwf/tNT
	c2IcMCy/Go7yldox0IjYnWKEPlLM90ZYV6fUsBZ6cCSBUHX49skJUjR6F28G4VOX2yJm
	kpcg==
Received: by 10.180.24.66 with SMTP id s2mr7974363wif.7.1334070918528; Tue, 10
	Apr 2012 08:15:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Tue, 10 Apr 2012 08:14:58 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Apr 2012 18:14:58 +0300
Message-ID: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
To: openembedded <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnKOtI1IC//SJG3qEoZHs9OTkk7l/EX9GZiotVjN4MCTEQhluZiDhUir/6BEzzq5MR3UCa/
Subject: js 185 -> js186_1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 15:24:36 -0000
Content-Type: multipart/alternative; boundary=f46d043be1d0343d7f04bd549743

--f46d043be1d0343d7f04bd549743
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Have a problem while updating js to version 185. This version renames the
library in libmozjs185. What to do in order to avoid breaking packages
which need libjs? Another interesting thing is that js is now called
js185_1.0.0 which seems to be actually another package / implementation? I
will try to test this using symlinks while compiling web package.

@g

--f46d043be1d0343d7f04bd549743
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div><div><br></div>Have a problem while updating js to version=
 185. This version renames the library in=A0libmozjs185. What to do in orde=
r to avoid breaking packages which need libjs?=A0Another=A0interesting thin=
g is that js is now called js185_1.0.0 which seems to be actually another p=
ackage / implementation? I will try to test this using symlinks while=A0com=
piling=A0web package.=A0
<div><br></div><div>@g</div>

--f46d043be1d0343d7f04bd549743--
