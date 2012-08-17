Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2JmP-0000my-9Q
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:27:49 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 03:15:49 -0700
Received: by obceq6 with SMTP id eq6so4419993obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 03:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=W+RlcPMSzqdoFK+rh6NAd7W7Uffwd6OLUx6en/5SpGM=;
	b=psLt8CMwTfEGopqpHjgeC7duimfN4nU2Vj0R2cwbxBH4qOqbnJ5icsy35R/hCXkqyt
	ebeN2q9J9VdcA66dBesZIYuqaUNqxwWg7d0+5sjfiJC6/7SPYSdyeMggvyHvO0N3BAlO
	H+JatOJR2Lho6GeGtAwK+YJ8leQnBDqIohZlxhULeZz7CjHqS9EF2jQIRQcW97AQmjJJ
	gsRl1/FW4guMIi2PkTXH7JiWALi+I6XTGwHLvDEqjmCmL5zKK42kpY4IJX0g+gKeRu/S
	29FXytxHc9G7udtTTb2GZxPwHKELaB2YuaQtVwYZ7kVYLKbBamlWjvBLu3wyXs9CqmED
	ratQ==
Received: by 10.182.50.68 with SMTP id a4mr3478730obo.59.1345198548537; Fri,
	17 Aug 2012 03:15:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Fri, 17 Aug 2012 03:15:28 -0700 (PDT)
In-Reply-To: <CAJTo0LY1MHvGKfVpH_Y5LcAJyEbKW+VvtAoiE2GKQG-dpXKnWQ@mail.gmail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
	<1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYBdGj1ANujgM0f0mU8OE5XXovegKzQqVhXROT=qa=6ZQ@mail.gmail.com>
	<CALbNGRSsFXRR4eqY_EDJmtdOzxnPU7i+vVqbbbL4zRg6YhVGLA@mail.gmail.com>
	<CAJTo0LY1MHvGKfVpH_Y5LcAJyEbKW+VvtAoiE2GKQG-dpXKnWQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Aug 2012 11:15:28 +0100
Message-ID: <CAJTo0LbxQVkszc+thqFaYpDkEOv-20_ZWnZ-PWXH=XpXA=YEBw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm+O4n0ZYWxiEI+BisNqxnNQspbwGYsqGpGViUGlXQOpjnW6FozwdXTxMXA/nsRwtJBM5kg
Subject: Re: [PATCH 2/2] webkit-gtk: update to 1.8.2
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
X-List-Received-Date: Fri, 17 Aug 2012 10:27:49 -0000
Content-Type: text/plain; charset=UTF-8

http://lists.webkit.org/pipermail/webkit-gtk/2012-August/001192.html
for anyone who really cares.

As I have an identical patch to this locally:

Acked-By: Ross Burton <ross.burton@intel.com>

Ross


