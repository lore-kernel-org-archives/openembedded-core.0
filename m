Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R5d0G-00030N-UF
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 14:31:17 +0200
Received: by ewy6 with SMTP id 6so848453ewy.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=gN2i9B6cWLVxrcpF1xbdJ4wOjyKBMFF/hwmB3PckKp8=;
	b=aHoR4oANwjweon8ZEusDbnhVit54Ax05yaZamoeZGSKkitbCFu5rfi+YdA02RgArNp
	t10sA3I6zhlEjBHaiZalEzOPLPrqZ3fD+db8q+SC5PqImcHmqjQ2j7c9SK6e/uL+VS4z
	MK45BsoInYepJ6HSjfgk9SKNuEfU6EuCzht7c=
MIME-Version: 1.0
Received: by 10.204.140.88 with SMTP id h24mr1659438bku.166.1316435159822;
	Mon, 19 Sep 2011 05:25:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Mon, 19 Sep 2011 05:25:59 -0700 (PDT)
In-Reply-To: <49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
	<CAP9ODKo9-6qHhCWfWS5_GXrNxw38VCXjzih2hdoWRQ9vY3MVFg@mail.gmail.com>
	<DD23E745-87D9-4831-85D4-C038CD79DCF7@dominion.thruhere.net>
	<CAP9ODKoemW81Sob3uUe-1LedWXcoJqEdkUGTj-+ZjgrUsytb_Q@mail.gmail.com>
	<49A59D49-5FF1-4F8D-A259-F6F8CA42ADC9@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 09:25:59 -0300
X-Google-Sender-Auth: T6Yg4W4KgTCN-t4Ex0hiHqAb3rw
Message-ID: <CAP9ODKpbVD-2AyXEMQG9D=6=F1n2kC-J=jOU7EPc2hWa_bjq6A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Mon, 19 Sep 2011 12:31:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2011 at 09:09, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
> I'd like to see 4.7.4 go in. Richard and Saul have made it clear that rem=
oving 4.7.3 isn't going to happen before the release, so I'm trying make a =
compromise here. Are you saying you would find it unacceptable for both 4.7=
.3 and 4.7.4 to be in OE-core for a short while?

Sure not. I can live with that and this is better then nothing but I
think Richard and Saul might rethink this assortment as 4.7.4 is in
use by us and proved stable too.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


