Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UQ41Q-0001LH-0q
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 01:01:46 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so1008809wgg.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=/hitMSeOlCHWtsy9tjuYer2F0Oujn9afjBc7/x3/ha4=;
	b=cvnB6sRADbHzryDV+WmCe8tbChJPAsvJAvlHeNtOZfTqdBsWWzEFTd6epFJrLQk+5z
	EEthBeEA3SLGEcdYLGFexKhiFzVyYJZBLoGkbaTIrG5BSUQICfjIOjiyt95NlUFd/yG9
	1wzPxaHKpYQA2FuBdqT2fgnIgWPBiWAXULdEqLAA54tL3nY2T05OT6CnAlFj69ynClIw
	F/ke9Koowh5WO40Uimqh7OXjmtEl6jkKbwAU3E92f77XxlgWE/e0NH55wgisz8HORPpm
	EAnVtnQC6gDihyX813W93g1DEK9Uk+FGWVuIYjD2rEv3M2gQr4Qw1cbChuv1NK7GrBy3
	sPeg==
MIME-Version: 1.0
X-Received: by 10.194.109.227 with SMTP id hv3mr6506187wjb.32.1365633862034;
	Wed, 10 Apr 2013 15:44:22 -0700 (PDT)
Received: by 10.194.167.73 with HTTP; Wed, 10 Apr 2013 15:44:21 -0700 (PDT)
In-Reply-To: <5165AB03.8020404@gmail.com>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
	<5165AB03.8020404@gmail.com>
Date: Wed, 10 Apr 2013 18:44:21 -0400
Message-ID: <CAHUNapQJ0qWxW7KZuUTvVhd62=nx4Y8GEdi30c-WHv+Te01rPw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
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
X-List-Received-Date: Wed, 10 Apr 2013 23:01:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 2:10 PM, Marco <koansoftware@gmail.com> wrote:
> Yes, it is copied from meta-openembedded into oe-core

I'm sorry, I thought the [meta-oe] in the subject line implied this
patch was destined for meta-openembedded, not coming from
meta-openembedded.

It seems rather confusing that both openembedded-core and
meta-openembedded use the same mailing list :-)

Is openembedded-core sometimes referred to as oe-classic? Or is that
something else?

Do poky and openembedded-core maintain their own meta-hob and
meta-skeleton components?


