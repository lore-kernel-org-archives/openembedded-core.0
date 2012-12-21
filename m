Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm6WC-0007Rg-1p
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 18:36:21 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 09:20:35 -0800
Received: by mail-vc0-f197.google.com with SMTP id m8so6968998vcd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 09:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ZN83b3XA16CdsTK7h6bMdyrveL4V4sNZuGdeOyUkAH4=;
	b=ON6gAhd3DjItCib7zGUGXfSlz0IwDhvStTEtc033zwNQVib+Z9BOrdk6A0BO8l9g7c
	foWS3h9GMjf8/3jZ9AK/vR28NEvBhKI3BKqzWAQSEeecqg3pdQgIDyEqpEAgZwENBOlC
	5UCHc+1TosI2Pjr0/VzumCrWTFD+q5szoTK77uDL41Sz3KKW4GGQcA6+IoHDN3dPjnfA
	Izse4C3R0VWjWlMOl5hwmrTgHH6GTjQkXXzxP1MHp5ds8diTcVCK4fut8RV3sXVnNt+9
	xxVJkLd2cU5q/f7M9nVW60SQiRu40wmvuPnG+zQfItweWvYsLTp2ASq69ia45ZHNAWAK
	nF9w==
X-Received: by 10.52.75.105 with SMTP id b9mr18398567vdw.28.1356110486906;
	Fri, 21 Dec 2012 09:21:26 -0800 (PST)
Received: by 10.52.75.105 with SMTP id b9mr18398558vdw.28.1356110486826; Fri,
	21 Dec 2012 09:21:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Fri, 21 Dec 2012 09:21:06 -0800 (PST)
In-Reply-To: <20121221131250.GR14543@jama.palm1.palmone.com>
References: <1356093547-21765-1-git-send-email-ross.burton@intel.com>
	<20121221131250.GR14543@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Dec 2012 17:21:06 +0000
Message-ID: <CAJTo0LZ1-XTy4rd6xdJ0+5ugOrAmJixHzYWgdyJNtOyoaZJ5vA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkXsfbqgIW0Faq47+dM6A/QUpYE5AoxMGokyfNcVmmFQnhw7BWREQMlDvXKkX6/K2DI1HQ6f3Obqv9xhl4wgq7fpbpCHaH66qipVDqKSVtfeehcDk1z9Vw7KqmQtFXPpFkMX/I/wtlKzvYCV32Pswz9Tw7rwmpwn9zDt+y05YpM8k5Mn2IlpD1X35gG1Qs3TftUB0x1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] vala-stub: add a stub for vala-native
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
X-List-Received-Date: Fri, 21 Dec 2012 17:36:21 -0000
Content-Type: text/plain; charset=UTF-8

On 21 December 2012 13:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> Doesn't this conflict with real vala-native?

Discussed with Martin, retracting this patch.

Ross


