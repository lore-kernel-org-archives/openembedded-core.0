Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoMka-00068s-PU
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 00:48:16 +0200
Received: by eaal1 with SMTP id l1so4230175eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 15:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=n7XaeGg3lUG1e8AySqH7af1VQPIcxh43JK9Mn5gVa+g=;
	b=Q+F+CRhQYoFSOLHUoPLEozsnNdumylmdlLOj9Ps6377ZAFISx8TRGweTYWijoInPkv
	J2EMYcqbRGApq5yC1Gjpy2xy5j7GVSoBEofgxUbOEGggiC0qtU6Ka1rcalidf4Q4YKMF
	WE7OnkuGQhJlvbyIlPMVBb6ke8hvv4aXDxuSMdNSmsUGwym10/XruP1bUhhsGPpZyngm
	Iw2zf94/3M1URnzrnbEbwwYaGMFP3D8IO0a0qprQzdPO1YCxrYBjM3Y1ASJg9/kHzfyn
	hSPm/W2ogsUm8QDdbWGRZ0BHWHJs8qRkr0J7ndHZLX3PEVHxhrK7wtuKbg4tdpSMNdAE
	UL4g==
Received: by 10.14.99.201 with SMTP id x49mr8315446eef.142.1341873427130; Mon,
	09 Jul 2012 15:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 15:36:36 -0700 (PDT)
In-Reply-To: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 15:36:36 -0700
Message-ID: <CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: The Mythical Sato Replacement
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
X-List-Received-Date: Mon, 09 Jul 2012 22:48:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 2:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> Shuku will be a descendent of Sato, that is continue to use the
> Matchbox Window Manager, Desktop, and Panel; although the latter two
> will be updated for GTK+ 3.  All applications will be removed and
> fully reconsidered when adding back, so the text editor might well
> change from leafpad to something that had a release in two years,
> Midori is looking like a good web browser choice instead of Web, the
> PIM suite removed, and so on.

Did you consider QT instead of GTK+ ? I think having wayland would be cool.


