Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9257160125
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 19:00:10 +0000 (UTC)
Received: by oihb9 with SMTP id b9so18586392oih.3
	for <openembedded-core@openembedded.org>;
	Tue, 19 May 2015 12:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tmSbOoAk4J0d8TMqjxiLo1bCKcRqgbVwUmyxfERlFJ8=;
	b=aaswXpwOcc4lkMwgz2tlc/DEbl7duf6OlvL/fCrwSWVpd4iOX37c/1Pf1CTRz2giK1
	xZDEPuehzUEnJH6rArwlcGiWC+O6RtIqHgs37sPHjT1xItUAsPl5t2wvLeT2sXjsWIDX
	zKg76oeWBwRS5VwqHcXlnOncwN8+s/o3qlFCGXYxRW42WeGZ7s3rf2i6v1ZrauoaoBb1
	yPpRTVtnoL2wZUf+HlfwD9mdltbQSyf+bRJSsZfaWcxuEeHAcJMia60IJvzkZz6PJjii
	lsQivyrb21ZLmU7fxDVGIrRFBpkkPQr/9XeKAvKt8sg/3wdZBKWhuB6k8GvwNOLMN3VL
	4ZsQ==
X-Gm-Message-State: ALoCoQm/1NbJWviqm0x//A7Q/MdHaqTGlHPOukoSOOCwJdOXEcK1eTFYEECQ0uisWgrr4ROaqRYw
X-Received: by 10.182.171.67 with SMTP id as3mr25853157obc.16.1432062011749;
	Tue, 19 May 2015 12:00:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.37.200 with HTTP; Tue, 19 May 2015 11:59:51 -0700 (PDT)
In-Reply-To: <555B5A3F.2070103@mlbassoc.com>
References: <555B53AB.2010804@mlbassoc.com>
	<CAP71WjyCqH34ULgHUmGx4S6bx0fm4gu2dNnOiLmZUZ0mQ4oM8A@mail.gmail.com>
	<555B5A3F.2070103@mlbassoc.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 19 May 2015 20:59:51 +0200
Message-ID: <CAP71WjwYBqy8-+BMXbcruK7XOXPYZ+E_Gez3V=CaeQXP6COsuQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: media player (gtk-play)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2015 19:00:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 5:43 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> This is what I'm looking for except I need to send these to gtk-play,
> the GUI front-end.

oops.. sorry.. read the email too quickly ;-)

