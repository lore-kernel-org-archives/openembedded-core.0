Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QtSo2-0006XE-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 01:12:23 +0200
Received: by ewy5 with SMTP id 5so210082ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 16:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AsUuj8abSpx5iax27A4+BQf/eZ9myGtDdBtC9/aNxR0=;
	b=MW4U/HG+GSLWNO2ITG1JBA3Te1qqsvH4ATLQ+EdYw1hspl0ZicCdZwyH58LJLBczx4
	2BjV+VZM2hAW2MvB4kSEGdj2npnl1P1ug9oIbASyN4pg3twkNhjtiYk2KSZfXYe0ITMa
	kAw6zUfuqdu7hIvbX/B2iijmF5TzqZDyHFn/I=
MIME-Version: 1.0
Received: by 10.213.107.17 with SMTP id z17mr542614ebo.114.1313536065184; Tue,
	16 Aug 2011 16:07:45 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Tue, 16 Aug 2011 16:07:45 -0700 (PDT)
In-Reply-To: <CAMKF1spbd4NEHoP-aRk6qorPLR079F33JwH8c7BOZpwOwcBRZg@mail.gmail.com>
References: <1313525796-21604-1-git-send-email-agnel.joel@gmail.com>
	<23CB1EF8-9ACB-4F95-BE6A-F084E515837A@beagleboard.org>
	<CAMKF1spbd4NEHoP-aRk6qorPLR079F33JwH8c7BOZpwOwcBRZg@mail.gmail.com>
Date: Tue, 16 Aug 2011 18:07:45 -0500
Message-ID: <CAD=GYpbY-DYM77_JV_-8fL2eKKj5Nk1yKp2sL5EErfUdQLq5Qg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "Dmytriyenko, Denys" <denys@ti.com>, "Kooi, Koen" <k-kooi@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] angstrom-task-gnome: Added gedit to task-gnome dependencies
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
X-List-Received-Date: Tue, 16 Aug 2011 23:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 16, 2011 at 6:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 16, 2011 at 2:24 PM, Jason Kridner <jkridner@beagleboard.org> wrote:
>> I see the README says this should be on the OE-core list, but maybe this should go on the Angstrom list?
>>
>
> it should go to angstrom-devel list in anycase
> if this is a patch against angstrom on top of oe.dev then it should go
> to oe-devel list too. oe-core is not needed

Hi Khem, just confirming that you mean meta-angstrom patches should go
to both oe-core and angstrom lists?

Thanks,
Joel


