Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sk84s-0006nL-U4
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 08:19:43 +0200
Received: by obcva7 with SMTP id va7so2638229obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 23:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=I+10qFKxHOcXXS2OI6lBnc0IdLXcGCjXymHgidEOemo=;
	b=jAUdERCq1ilaI1jT1jjv6RMrDRoqvQa7IwqaWL67zP4bAo8tK+BgVwI+09R1M8XB3x
	cdYTca9ghY+efHawZv6gmdPW+a6b/DUUA3tU01Jgi+64javcA0f602J1oRD7lzDTZbsM
	dzoaBQekIurd8TM5ZvzSqkRipGrojMGrMypNx2MaaAEOY9iyvt7BzmucSB+PCUd4FVoT
	Dty1Tb7ruQYIJGl+MtI/FnHTZT09wqPSkg21tHfjOsY6eO+aheXwaUYz81bJfR9YLzoW
	2KGrAILS8s+iJ3kcWHY2EQaLesJyHFnl+mhHkPwBx0nCrmdpbsXAzKhXv5uOcXOkpd9o
	axQg==
MIME-Version: 1.0
Received: by 10.182.50.103 with SMTP id b7mr663281obo.15.1340863728267; Wed,
	27 Jun 2012 23:08:48 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 23:08:48 -0700 (PDT)
Date: Thu, 28 Jun 2012 14:08:48 +0800
Message-ID: <CAF1ZMEftbcYLjj-qFiXgGQysr_pnfMMonXJz25TO3+UXXj4ckQ@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: xcursor-transparent-theme-0.1.1: upstream source vanish
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
X-List-Received-Date: Thu, 28 Jun 2012 06:19:43 -0000
Content-Type: text/plain; charset=UTF-8

HI Folks:
 Hit following error, seems that upstream source vanished
either provide with another valid download url, or deprecated this package?
any idea?

Dennis

ARNING: Checksum error encountered with download (will attempt other s[92/1931]
URL: 'http://matchbox-project.org/sources/utils/xcursor-transparent-theme-0.1.1.
smatch!
File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
220de09423be0364e9a060bf7e4 was expected
ERROR: Fetcher failure for URL: 'http://matchbox-project.org/sources/utils/xcurs
-0.1.1.tar.gz'. Checksum mismatch!
File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
220de09423be0364e9a060bf7e4 was expected
ERROR: Function failed: Fetcher failure for URL: 'http://matchbox-project.org/so
transparent-theme-0.1.1.tar.gz'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/dennis/oe/oe-core/build/tmp-eglibc/wo
sor-transparent-theme-0.1.1-r4/temp/log.do_fetch.2231


