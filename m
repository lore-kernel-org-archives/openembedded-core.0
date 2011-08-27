Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QxAkB-0003Jt-Ss
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 06:43:43 +0200
Received: by eyb7 with SMTP id 7so2970573eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 21:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1cJpREoPeYNzLemYNzC0vhTI9LxieK9F8+7wULoUK4Y=;
	b=drEQyT3tnJag+9pJGGsuFtDTlEy6pD/RX6h+3zOheMtjUltDH1qjCGH6lgXnxg0cWJ
	6ySKXQiY9G7x+rdWAu68BBW3qF+Js/mkMFMgbP/mvYQ8Yvp9A+Jhm4GGCjxjoqA3WONS
	QYbPWRm3LRDHZ+DB0me3Rnv9QwBkv8Mduc6rE=
MIME-Version: 1.0
Received: by 10.213.26.219 with SMTP id f27mr2040926ebc.76.1314419934721; Fri,
	26 Aug 2011 21:38:54 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Fri, 26 Aug 2011 21:38:54 -0700 (PDT)
In-Reply-To: <4a795deb3789430487146a8425c1c337@DLEE74.ent.ti.com>
References: <4a795deb3789430487146a8425c1c337@DLEE74.ent.ti.com>
Date: Fri, 26 Aug 2011 23:38:54 -0500
Message-ID: <CAD=GYpYAYS3VMWKWOd1vOBCwTACd8O95kvumrNXfxg1ufG4sNw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Sat, 27 Aug 2011 04:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 26, 2011 at 10:26 PM, Fernandes, Joel A <joelagnel@ti.com> wrote:
> v2 Changes:
> Addressing Koen's feedback on patches
> * Added a PR to all recipes

I thought you meant the PR when you said "Which version", didn't know
you were talking about the LICENSE versions.

Anyway, Can we leave the PRs I put into patches 2/4 and 4/4 in?

Also, is it necessary to update LICENSE versions or can we leave it as
is, as I've seen many recipes in oe-core that have it without a
version number.

thanks,
Joel

> * Changed meta-ti in subject to meta-oe
>
> Patches in the series:
>
> [PATCH v2 meta-oe 1/4] gedit: Imported from OE classic
> [PATCH v2 meta-oe 2/4] gtksourceview: Imported from OE classic
> [PATCH v2 meta-oe 3/4] libgnomecups: Imported from OE Classic
> [PATCH v2 meta-oe 4/4] libgnomeprint: Imported from OE classic
>


