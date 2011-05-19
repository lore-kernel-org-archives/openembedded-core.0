Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1QN8jf-0007CK-Bj; Thu, 19 May 2011 21:18:15 +0200
Received: by eye27 with SMTP id 27so1015796eye.6
	for <multiple recipients>; Thu, 19 May 2011 12:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=NKFZIu6KyPKHOmlhYbUi8QjXoK34+unNnj2UsGHdrzI=;
	b=bf99bzi5GgpcEouKI1QcwUXiKvfQ5WvyzceDnNz6ne5E/o4NWrGN3hPWOj4965K7hP
	yoeAEO2PoF35J3Ru9IlRan7iF1zGDrskCBN7x/HQqAkXARAb2GO5HKyZd+mafy7vxH/H
	KeupWH5rGOoND33AjEptNuqagrXMmn5gBx2pk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=kRPDAg71Ioc8SutApFMNHZ0VR8WolYSFpToZ4XQ+ONgB8y9ECZOnD8GU3Vg8Ig7lYV
	zKUfg+3YJMaqnfCDWls8EDWuiAi/Iiw9C5TogXf5XuJb14QTggBAh0qwBsegMjs1InSe
	1KpCmJsM3BudUoCTlsRMp9ZdNwovtzV6KX7ps=
Received: by 10.204.181.7 with SMTP id bw7mr1085997bkb.16.1305832519270; Thu,
	19 May 2011 12:15:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.205.82.12 with HTTP; Thu, 19 May 2011 12:14:59 -0700 (PDT)
In-Reply-To: <BANLkTimEO3P8JmjcS9s50yqJWB=nBAkq+Q@mail.gmail.com>
References: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>
	<BANLkTimEO3P8JmjcS9s50yqJWB=nBAkq+Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 19 May 2011 12:14:59 -0700
X-Google-Sender-Auth: wPc6St3Fe2Kfe5-XHHUYqfzTHuI
Message-ID: <BANLkTinY3fkK5oK58EC-yXmW37VZkbiV4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] OE Changelog for 2011-4-8 to 2011-4-15
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
X-List-Received-Date: Thu, 19 May 2011 19:18:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2011 at 11:43 AM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> Are there any other repos or maillists that I should include in this
> report? =C2=A0I'm trying to increase visibility in what all the projects
> are doing, so we can reduce duplication of work in various layers.

There's a meta-slugos now, and pb is hosting a meta-micro. Those are
all that come to mind off the top of my head. Not sure how much you
want to include :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


