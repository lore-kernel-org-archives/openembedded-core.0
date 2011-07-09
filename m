Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfZ0g-00073J-5K
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 16:59:58 +0200
Received: by bwf20 with SMTP id 20so2764701bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2011 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qgP6qO0FAuWcYRC5VbskseTCz9pKop+2wAAlIClUTKM=;
	b=PGB9ZfBfIHr4mXMljN/YJLHio+0moSvByvmXgmBANIHtugTS/ntxruvhg3yUeAHoUr
	W+vFsoKUgk4fypEQWTp4h1ElMdeSVFUwkS08DDz6b3HyfYDgmJ8PQHAkWnfQPww8vprQ
	SKLaHSe9V5ofQKJwuua5hY1IvVFNZmh5UIklw=
MIME-Version: 1.0
Received: by 10.205.24.79 with SMTP id rd15mr1942276bkb.177.1310223364183;
	Sat, 09 Jul 2011 07:56:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.75 with HTTP; Sat, 9 Jul 2011 07:56:03 -0700 (PDT)
In-Reply-To: <cover.1310175992.git.dvhart@linux.intel.com>
References: <cover.1310175992.git.dvhart@linux.intel.com>
Date: Sat, 9 Jul 2011 11:56:03 -0300
X-Google-Sender-Auth: oYo0s5tv4ryVjulrkC9cRkDdBeU
Message-ID: <CAP9ODKpNStsrN2fdncsyxFt4cgPi2jiZtZWFeMy92Psk5CjBSA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/1] bb-matrix performance metrics gathering and visualization scripts
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
X-List-Received-Date: Sat, 09 Jul 2011 14:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 23:02, Darren Hart <dvhart@linux.intel.com> wrote:
> =A0bb-matrix: initial scripts to record TIME(1) metrics for BB and PM
> =A0 =A0combinations

please drop initial scripts; it doesn't matter et all if it is a
script and if it is merged it is because it is usable and worth having
it so the initial status makes no useful contribution to the short
description. Long description can make clear and more detailed
explanation.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


