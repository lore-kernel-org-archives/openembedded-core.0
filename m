Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUZGf-0005dQ-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:12:05 +0200
Received: by mail-vc0-f176.google.com with SMTP id hf12so354915vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=J7hg1hvubkxWOLbCL1FRhKYiKTWcj2ASzeNfFdOabcc=;
	b=CiEmvyVQzfbEH3NoDASU22TTTVgseFxUEwW1I3zXS5FH1PemcD3T7pLDieyyutPVh2
	V0IVIonffmpgQiluHMUxpZsAjDq9iyxis1bKpjQ/72o7BrjcvsBVM5ZRLDlLkB1NItsP
	RhPk8XRKMC7bUtN75rlpwgLNuYlhBr4stfzO5WShUNshTM15iCF7eSuYNCXoJDWQ3QUy
	3qkJg8OHJg8CXaXdwnAluWviYVTG0R7U8UynQuJOp2RKbKJzDQ0g90Heg2ScnSZCwQzd
	lKPT3NwNBSjBf66HUNQcfgf9/4yUk5xngtp57qr5ikDQSohygchpXhG7XFgFdTSKyXPG
	isFw==
X-Received: by 10.52.158.163 with SMTP id wv3mr18518309vdb.82.1366707264714;
	Tue, 23 Apr 2013 01:54:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 01:54:04 -0700 (PDT)
In-Reply-To: <CANyK_8eqqb0SF9BkavGXvcMzTuX1WWf+2MzoKN+AL0Whf0R8Xg@mail.gmail.com>
References: <CANyK_8daiW+Mn9LQLh72hgqPjW-HOYMMKR68fB=A2k-gT42gUw@mail.gmail.com>
	<CAJTo0LYOs1f5oTDQJY23YQmgJ=E5mUAYNquRkOg=+6ehqsaFVg@mail.gmail.com>
	<CANyK_8eqqb0SF9BkavGXvcMzTuX1WWf+2MzoKN+AL0Whf0R8Xg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 09:54:04 +0100
Message-ID: <CAJTo0La_SRP0t23GzQKK6zmFauwOreWHKO4k+Q4KNG6eUr_PrA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
X-Gm-Message-State: ALoCoQlHx7eV2BUv8fpAVuyLAK5PdWtg2Fk2S5mcBr0exu3FJji5addjGKOt0P+O3E8mytKPwGm0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: AGPL-3.0
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
X-List-Received-Date: Tue, 23 Apr 2013 09:12:06 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 09:47, Paul Barker <paul@paulbarker.me.uk> wrote:
> I noticed a couple of HTML-isms in OFL-1.1 (when diffing against the
> license of a package to be sure that it was the same license text)
> such as '&amp;' instead of just '&' and '&#8212;' instead of '--'. Do
> these want fixing as well?

Sounds reasonable to me.

Ross


