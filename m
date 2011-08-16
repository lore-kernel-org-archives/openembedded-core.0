Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1QtGM5-0006hx-FZ for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 11:54:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1QtGHd-0005nU-TM for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 11:50:05 +0200
Received: from 92-100-233-214.dynamic.avangarddsl.ru ([92.100.233.214])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 11:50:05 +0200
Received: from dbaryshkov by 92-100-233-214.dynamic.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 11:50:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 16 Aug 2011 08:09:37 +0000 (UTC)
Message-ID: <j2d8k1$8a6$1@dough.gmane.org>
References: <1313481869-16652-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 92-100-233-214.dynamic.avangarddsl.ru
User-Agent: Pan/0.133 (House of Butterflies)
Subject: Re: [PATCH] binutils-2.20.1: import several patches from	Debian
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
X-List-Received-Date: Tue, 16 Aug 2011 09:54:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 16 Aug 2011 12:04:29 +0400, Dmitry Eremin-Solenikov wrote:

> Import several patches from Debian to improve --no-add-needed handling
> vs. weak symbols and branching to weak symbols on arm.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.org>

Please ignore this patch, it contains a leaked .swp file. Please apply
the V2 of it.

-- 
With best wishes
Dmitry




