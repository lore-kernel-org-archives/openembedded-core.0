Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T71Pb-0005qn-W0
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 11:51:44 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 02:39:27 -0700
Received: by obblz20 with SMTP id lz20so2882619obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 02:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=y28eYTQYlGg5GZWVwSXCBvu9qMbTdlFLbYjCg/sjQrw=;
	b=Gog0y8+fJB09VNUR6sQk89eFXq8lJe8tMjY8nGYPM9UDahHrel90fBJqxGpT0ZZ084
	uov4t3t1EzxJDNZmiyl6yECbQfyJRiCf6nCK9e7J6UfADw4+h2hE6U4Soh0/OaX45UnB
	tcTQnt+SuDYVJTguq9M5MNMqsiitOJ7rmdoX7dOtlW+BiG/X7xwzgyX/tbLz2XFN1f7K
	dtQ4b5nDuxVq80AzmHT5s6koL2FLtbhvqaEYXV7MmGtyTKtzkqWVyYdZaD7ZVU2Q6rlB
	9p10sfYaCwA3osfC9Z8HAXxg7PSXJtaTFKV0OZVliqKTO7e+E21MpRDq7oQp5O1tCC3U
	tacQ==
Received: by 10.60.30.168 with SMTP id t8mr3661883oeh.89.1346319566403; Thu,
	30 Aug 2012 02:39:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 02:39:05 -0700 (PDT)
In-Reply-To: <CB4AF056-1525-4567-8E14-AA234CDE6AAC@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<1346255613-13401-2-git-send-email-ross.burton@intel.com>
	<CB4AF056-1525-4567-8E14-AA234CDE6AAC@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 10:39:05 +0100
Message-ID: <CAJTo0Lakk5xDHTK2QVfsg_aSwXqsxfY6BdQJifttAyVav2qvsg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmfV7YtmVjaJ+mrWhWa3UarnK3H9wEWgZBEZ64hLthEmpSKRhwuVq+z6uKWPL7+r8DfjE9x
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] task-core-x11: default to xserver-xorg instead of kdrive
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
X-List-Received-Date: Thu, 30 Aug 2012 09:51:44 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 17:50, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Missing PR bumps

Fixed on the branch.

Ross


