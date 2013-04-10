Received: from mail-vb0-f49.google.com ([209.85.212.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPxCR-0002gr-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 17:44:42 +0200
Received: by mail-vb0-f49.google.com with SMTP id 11so467633vbf.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 08:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=tlPgiad6dN0RbzGt6P4oU6SErLW5KTz3W8Qe9EHf4ZU=;
	b=lfDKNqwipvdF+ajIeQ+C11STJpVE9JRVmkxNbfC86c6CcQ5+/4QbIYgc4NM/nAFZsA
	fzrx3PnVPhlNtFN6DCA3YleoW3Uos2sc2xKrmooP3x1o37OrnzCQ+hBwahs1tcNLjjP/
	EPWKjBNScYsewYXR6eVXwzJ00UHwtQne/N9F6pYcm2/ZyXAqohA0cOA1B0RHoYd/xUkG
	7W3d2ItK6Ogyw6KMwmHRfjA4st+j6X84h++2xIN2ux3ckPr32LZJ+MuuIuD/bNqHi3wd
	JO7qcZnuXIfJgYM02eqUcPZt/u3VsBrsaRwx+CeZ8LP/cFqkzKDDyP7WHmENKWclSQ2+
	lGnA==
X-Received: by 10.220.140.18 with SMTP id g18mr1861759vcu.54.1365607637508;
	Wed, 10 Apr 2013 08:27:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 10 Apr 2013 08:26:57 -0700 (PDT)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594D8E8A@DLEE11.ent.ti.com>
References: <1365081955-19381-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED101594CB39E@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594D8E0F@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594D8E8A@DLEE11.ent.ti.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Apr 2013 16:26:57 +0100
Message-ID: <CAJTo0LZP+Z1a_ty1qEU7cGLSnW1jgTO_17-M0SCgVU1DzpeZ7g@mail.gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Gm-Message-State: ALoCoQnAwv47bWyxnCPGKfCxMBAEVXSA1Im1/f+cDlBmPaZIG6ESAZJXzIZcC+0s0y8OWZKR7T1x
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB symlinks for devicetree
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
X-List-Received-Date: Wed, 10 Apr 2013 15:44:43 -0000
Content-Type: text/plain; charset=UTF-8

On 10 April 2013 16:16, Maupin, Chase <chase.maupin@ti.com> wrote:
> In that case ping on this.

It's in my pending list, but the 1.4 release freeze has been taking my
time.  I'll merge it tomorrow.

Ross


