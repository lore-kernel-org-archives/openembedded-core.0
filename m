Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWFk-0002TT-IW
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:36:08 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:23:36 -0700
Received: by obblz20 with SMTP id lz20so1373019obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=DkipUi75lhwaWS3N+Gm3Acp9df9W8Pg7LMUe4WhqwQE=;
	b=lLSsRgneAIqVfWNGugckVqWyvSBoDfLAdQ46W1uCGybsdrYXzdMFiXRjnSNV8qCXfC
	4s4xZuRXeUWGvcRsKedX0A3JF683se9jXkWBrZ1SUdvLk7mc1xsiUZ7/6DDoVAn7qZMW
	Ko0Ci+4tHn8PudFe4OhIt3B44cUTT9bMFnuimNczMk+Ki7kue2zSa0tGe4F4esf49qP1
	axLlkBgP1LglCl7rDRSSKua3uQppJ9B+1MLuErupDVs7vNkbsl5lB/noZh5jufnIaVDA
	zS1xZwAighWv2jTwyZWpMZaas+TNxujAg0IzEbsYjsqSv3hkwPS8YKz9h6kgBn52xAMQ
	WhHg==
Received: by 10.182.193.105 with SMTP id hn9mr19492083obc.11.1347391416090;
	Tue, 11 Sep 2012 12:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 12:23:15 -0700 (PDT)
In-Reply-To: <504F8EB5.30503@intel.com>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
	<504F8EB5.30503@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 20:23:15 +0100
Message-ID: <CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQlNXekvGkscAh2ELrndlcOfLT1yZ+j3C3ayZzKmNR/Iigh0NWXSTSOJTESKtx2E6xwXk6GR
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Sato virtual keyboard - how to close it?
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
X-List-Received-Date: Tue, 11 Sep 2012 19:36:08 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 20:19, Scott Garman <scott.a.garman@intel.com> wrote:
> Negatory on both counts. Sounds like a bug?

Certainly does.  Not sure how that regressed or how QA didn't notice.
So clicking on a button or check box doesn't make the keyboard hide?
Eek.

Ross


